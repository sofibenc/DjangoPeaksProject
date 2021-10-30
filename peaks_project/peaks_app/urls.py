from django.urls import path, register_converter
from django.conf.urls import url

from . import views


class FloatConverter:
    regex = '[\d\.\d]+'

    def to_python(self, value):
        return float(value)

    def to_url(self, value):
        return '{}'.format(value)


register_converter(FloatConverter, 'float')

urlpatterns = [
    # url(r'test', views.home, name='home'),
    # path('listboundingbox/<float:top>/<float:left>/<float:right>/<float:bottom>',
    # views.peakListBoundingBox, name="peaksBoundingBox"),
    # path('create', views.peakCreate, name="create"),
    # path('update/<str:pk>/', views.peakUpdate, name="update"),
    # url(r'^listboundingbox/$', views.peakListBoundingBox, name="peaksBoundingBox"),

    path('read/<str:pk>/', views.peakRead, name="read"),
    path('create', views.peakCreateAPIView.as_view(), name="create2"),
    path('update/<str:pk>/', views.peakUpdateAPIView.as_view(), name="update2"),
    path('delete/<str:pk>', views.peakDelete, name="delete"),
    url(r'^listboundingbox/$', views.peakListBoundingBoxAPIView.as_view(), name="peaksBoundingBox2"),
    path('listall', views.peakList, name="listall")
]
