import uuid

from django.db import models
from django.utils import timezone
from django.utils.translation import ugettext as _


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
