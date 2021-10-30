from typing import OrderedDict
from rest_framework.response import Response
from rest_framework.decorators import api_view
from rest_framework import status
from rest_framework.views import APIView
from rest_framework.schemas import AutoSchema

from django.shortcuts import render
from django_admin_geomap import geomap_context
from django.utils import timezone
from django.core.exceptions import PermissionDenied

from requests import get
import coreapi
import ipinfo
from .models import Peak, WhitelistCountry, RejectedConnection
from .serializers import PeakSerializer


def get_ip_details(ip_address=None):
    ipinfo_token = "4be8f32f80c8a5"
    ipinfo_settings = {}
    ip_data = ipinfo.getHandler(ipinfo_token, **ipinfo_settings)
    ip_data = ip_data.getDetails(ip_address)
    return ip_data


def get_country_name(remote_addr):
    ip_data = get_ip_details(remote_addr)
    return ip_data.country_name


def get_visitor_ip_address(request):
    ip = get('https://api.ipify.org').text
    if not ip:
        x_forwarded_for = request.META.get('HTTP_X_FORWARDED_FOR')
        if x_forwarded_for:
            ip = x_forwarded_for.split(',')[0]
        else:
            ip = request.META.get('REMOTE_ADDR')
    return ip


def is_in_whitelist(request):
    remote_addr = get_visitor_ip_address(request)
    country_name = get_country_name(remote_addr)
    return [country_name and WhitelistCountry.objects.filter(country__icontains=country_name),
            (remote_addr, country_name)]


def AppendRejectedConnection(remote_addr, country_name):
    p = RejectedConnection(remote_addr=remote_addr, country=country_name if country_name else "Unknown",
                           pub_date=timezone.now())
    p.save()


def home(request):
    """
    Some examples :
    remote_addr = "89.84.138.4" -> France
    remote_addr = "168.156.54.5" -> United States
    """
    authorized, (remote_addr, country_name) = is_in_whitelist(request)
    if authorized:
        return render(request, 'peaks_app/home.html', geomap_context(Peak.objects.all()))
    else:
        AppendRejectedConnection(remote_addr, country_name)
        raise PermissionDenied


# Describing schema to workaround swagger and docs limitation
class peakCreateUpdateViewSchema(AutoSchema):
    """
        Describe Create & Update schema
    """
    def get_manual_fields(self, path, method):
        extra_fields = []
        if method.lower() in ['post']:
            extra_fields = [
                coreapi.Field('name'),
                coreapi.Field('lat'),
                coreapi.Field('lon'),
                coreapi.Field('altitude')
            ]
        manual_fields = super().get_manual_fields(path, method)
        return manual_fields + extra_fields


class peakListBoundingBoxViewSchema(AutoSchema):
    """
        Describe ListBoundingBox schema
    """
    def get_manual_fields(self, path, method):
        extra_fields = []
        if method.lower() in ['get']:
            extra_fields = [
                coreapi.Field('top'),
                coreapi.Field('left'),
                coreapi.Field('right'),
                coreapi.Field('bottom')
            ]
        manual_fields = super().get_manual_fields(path, method)
        return manual_fields + extra_fields


# ----------------------------
# Describing API
# ----------------------------
@api_view(['GET'])
def peakList(request):
    """
    get: Get all peaks.
    """
    authorized = is_in_whitelist(request)
    if authorized[0]:
        peaks = Peak.objects.all()
        serializer = PeakSerializer(peaks, many=True)
        return Response(serializer.data)
    else:
        return Response(status=status.HTTP_403_FORBIDDEN)


@api_view(['DELETE'])
def peakDelete(request, pk):
    """
    delete: Delete peak.
    """
    authorized = is_in_whitelist(request)
    if authorized[0]:
        peaks = Peak.objects.get(id=pk)
        peaks.delete()
        return Response('Deleted')
    else:
        return Response(status=status.HTTP_403_FORBIDDEN)


@api_view(['GET'])
def peakRead(request, pk):
    """
    get: Get detail of a specefic peak.
    """
    authorized = is_in_whitelist(request)
    if authorized[0]:
        peaks = Peak.objects.get(id=pk)
        serializer = PeakSerializer(peaks, many=False)
        return Response(serializer.data)
    else:
        return Response(status=status.HTTP_403_FORBIDDEN)


class peakListBoundingBoxAPIView(APIView):
    """
    get: Get list of peaks delimited by given bounding box coordinates.
    """
    schema = peakListBoundingBoxViewSchema()
    serializer_class = PeakSerializer
    queryset = Peak.objects.all()

    def get(self, request):
        authorized = is_in_whitelist(request)
        if authorized[0]:
            # 1st point coordinate
            top_lat = float(request.GET.get('top'))
            left_lon = float(request.GET.get('left'))

            # 2nd point coordinate
            bottom_lat = float(request.GET.get('bottom'))
            right_lon = float(request.GET.get('right'))

            peaks = Peak.objects.all()
            serializer = PeakSerializer(peaks, many=True)
            c = list()
            for x in serializer.data:
                if bottom_lat <= x['lat'] <= top_lat and left_lon <= x['lon'] <= right_lon:
                    c.append(x)
            return Response(c)
        else:
            return Response(status=status.HTTP_403_FORBIDDEN)


class peakCreateAPIView(APIView):
    """
        Create a new peak.
    """
    schema = peakCreateUpdateViewSchema()
    serializer_class = PeakSerializer
    queryset = Peak.objects.all()

    def post(self, request):
        authorized = is_in_whitelist(request)
        if authorized[0]:
            serializer = self.serializer_class(data=request.data)
            if serializer.is_valid():
                serializer.save()
                return Response(serializer.data, status=status.HTTP_201_CREATED)
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
        else:
            return Response(status=status.HTTP_403_FORBIDDEN)


class peakUpdateAPIView(APIView):
    """
        Update peak.
    """
    schema = peakCreateUpdateViewSchema()
    serializer_class = PeakSerializer
    queryset = Peak.objects.all()

    def post(self, request, pk):
        authorized = is_in_whitelist(request)
        if authorized[0]:
            peak = Peak.objects.get(id=pk)
            serializer = PeakSerializer(instance=peak, data=request.data)
            if serializer.is_valid():
                serializer.save()
                return Response(serializer.data, status=status.HTTP_201_CREATED)
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
        else:
            return Response(status=status.HTTP_403_FORBIDDEN)
