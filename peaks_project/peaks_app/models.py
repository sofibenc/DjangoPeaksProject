from django.db import models
from django_admin_geomap import GeoItem


class Peak(models.Model, GeoItem):
    name = models.CharField(max_length=200)
    lat = models.FloatField()
    lon = models.FloatField()
    altitude = models.FloatField()

    def __str__(self):
        return self.name

    @property
    def geomap_longitude(self):
        return '' if self.lon is None else str(self.lon)

    @property
    def geomap_latitude(self):
        return '' if self.lon is None else str(self.lat)

    @property
    def geomap_popup_view(self):
        return "<strong>{}</strong><br><strong>Altitude = {} km</strong>".\
            format(str(self.name), str(self.altitude))

    @property
    def geomap_popup_edit(self):
        return self.geomap_popup_view

    @property
    def geomap_popup_common(self):
        return self.geomap_popup_view

    @property
    def geomap_icon(self):
        return self.default_icon


class RejectedConnection(models.Model):
    remote_addr = models.GenericIPAddressField(blank=True, null=True, verbose_name="remote address")
    country = models.CharField(max_length=200)
    pub_date = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.remote_addr + " ({})".format(self.country) + " at {} {}".\
            format(self.pub_date.date(), self.pub_date.time())


class WhitelistCountry(models.Model):
    country = models.CharField(max_length=200)

    class Meta:
        verbose_name_plural = "WhitelistCountries"

    def __str__(self):
        return self.country
