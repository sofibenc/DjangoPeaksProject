from django.contrib import admin
from .models import Peak, RejectedConnection, WhitelistCountry
from django_admin_geomap import ModelAdmin

admin.site.register(Peak, ModelAdmin)
admin.site.register(RejectedConnection)
admin.site.register(WhitelistCountry)

