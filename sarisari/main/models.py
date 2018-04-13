import uuid

from django.db import models
from django.utils import timezone
from django.utils.translation import ugettext as _

from phonenumber_field.modelfields import PhoneNumberField


optional = {
    'blank': True,
    'null': True,
}


class BaseModel(models.Model):
    """
    Models inheriting from this class will be time-stamped and will have an
    auto-generated UUID field.
    """
    
    uuid = models.UUIDField(verbose_name=_('UUID'), unique=True,
                            default=uuid.uuid4, editable=False)
    datetime_created = models.DateTimeField(verbose_name=_('Created'),
                                            editable=False)
    datetime_updated = models.DateTimeField(verbose_name=_('Modified'),
                                            editable=False)
    
    class Meta:
        abstract = True
    
    def save(self, *args, **kwargs):
        # check if the instace already has an id
        if not self.id:
            self.datetime_created = timezone.now()
        
        # update date modified
        self.datetime_updated = timezone.now()
        
        return super(BaseModel, self).save(*args, **kwargs)


class Location(BaseModel):
    """
    Used for listing addresses or locations. Separating it as a different class
    by itself as a `Supplier` or `Outlet` can have multiple locations. Open for
    debate.
    
    Might use `pypostal` <
    https://github.com/openvenues/pypostal> in the future to generate maps and
    additional address fields.
    """
    
    address = models.TextField(verbose_name=_('Address'))
    
    class Meta:
        verbose_name = _('location')
        verbose_name_plural = _('locations')
    
    def __str__(self):
        return _('Location')


class PhoneNumber(BaseModel):
    """
    Used for storing phone numbders of an entity. Still at a
    basic implementation.
    """
    
    MOBILE = 'MOB'
    FAX = 'FAX'
    WORK = 'WRK'
    LANDLINE = 'LND'
    NUMBER_TYPE_CHOICES = (
        (MOBILE, _('Mobile')),
        (FAX, _('Fax')),
        (WORK, _('Work')),
        (LANDLINE, _('Landline')),
    )
    
    number_type = models.CharField(verbose_name=_('Type'), max_length=3,
                                   choices=NUMBER_TYPE_CHOICES,
                                   default=MOBILE)
    number = PhoneNumberField(verbose_name=_('Number'), blank=True)
    
    class Meta:
        verbose_name = _('phone number')
        verbose_name_plural = _('phone number')
    
    def __str__(self):
        num_type = dict(NUMBER_TYPE_CHOICES).get(self.number_type, _('Some'))
        return _(f'{num_type} Number')
