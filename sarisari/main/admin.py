from django.contrib import admin

from .models import Location, PhoneNumber


@admin.register(Location)
class LocationAdmin(admin.ModelAdmin):
    pass


@admin.register(PhoneNumber)
class PhoneNumberAdmin(admin.ModelAdmin):
    pass
