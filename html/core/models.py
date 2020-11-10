from django.conf import settings
from django.db import models
from django.shortcuts import reverse
from django.contrib.auth.models import AbstractUser
from django.template.defaultfilters import slugify
from autoslug import AutoSlugField

# Create your models here.
class Tuner(models.Model):
    SIGNAL_TYPE = (
        ('S', 'S'),
        ('S2', 'S2'),
        ('T', 'T'),
        ('T2', 'T2')        
    )
    POLAR = (
        ('H', 'Horizontal'),
        ('V', 'Vertical'),
        ('R', 'Right'),
        ('L', 'Left')
    )
    title = models.CharField(max_length=200, blank=False, verbose_name='Name')
    dvb_id = models.CharField(max_length=25, blank=False, verbose_name='ID')
    url = AutoSlugField(populate_from='dvb_id', max_length=50)
    adapter_id = models.CharField(max_length=200, blank=False, verbose_name='Adapter')
    signal_type = models.CharField(max_length=2, blank=False, choices=SIGNAL_TYPE)
    frequency = models.SmallIntegerField(blank=False, default=0, verbose_name='Frequency')
    polarization =  models.CharField(max_length=2, blank=False, choices=POLAR)
    symbolrate = models.SmallIntegerField(blank=False, default=0, verbose_name='Symbolrate')
    lof1 = models.SmallIntegerField(blank=True, default=0, verbose_name='lof1 (MHz)')
    lof2 = models.SmallIntegerField(blank=True, default=0, verbose_name='lof2 (MHz)')
    slof = models.SmallIntegerField(blank=True, default=0, verbose_name='slof (MHz)')
    snr = models.PositiveIntegerField(blank=True, default=0, verbose_name='SNR')
    bitrate = models.PositiveIntegerField(blank=True, default=0, verbose_name='Signal')
    unc = models.CharField(blank=True, max_length=10, default=0, verbose_name='UNC')
    ber = models.PositiveIntegerField(blank=True, default=0, verbose_name='BER')

    def __str__(self):
        return (self.title)

    class Meta:
        verbose_name='Tuner'
        verbose_name_plural='Tuners'

class Stream(models.Model):
    SERVICE_TYPE = (
        ('1', 'Video'),
        ('2', 'Radio'),
        ('3', 'Teletext')
    )
    enable = models.BooleanField(default=True, verbose_name='Enable')
    title = models.CharField(max_length=200, blank=False, verbose_name='Title')
    stream_id = models.CharField(max_length=200, blank=False, verbose_name='ID')
    url = AutoSlugField(populate_from='stream_id', max_length=150)
    set_map = models.CharField(blank=True, max_length=200, verbose_name='Map PIDs', null=True)
    set_pnr = models.IntegerField(blank=True, verbose_name='Set PNR', null=True)
    set_tsid = models.IntegerField(blank=True, verbose_name='Set TSID', null=True)
    service_type = models.CharField(max_length=1, blank=True, choices=SERVICE_TYPE)
    service_provider = models.CharField(max_length=200, blank=True, verbose_name='Provider Name')
    service_name = models.CharField(max_length=200, blank=True, verbose_name='Service Name')
    input_u = models.CharField(max_length=200, blank=False, verbose_name='Input')
    output_u = models.CharField(max_length=200, blank=False, verbose_name='Output')
    scrambled = models.PositiveIntegerField(blank=True, default=0, verbose_name='Scram')
    bitrate = models.PositiveIntegerField(blank=True, default=0, verbose_name='Bitrate')
    cc_error = models.PositiveIntegerField(blank=True, default=0, verbose_name='CC-Errors')
    pes_error = models.PositiveIntegerField(blank=True, default=0, verbose_name='Pes-Errors')
    ready = models.PositiveIntegerField(blank=True, default=0, verbose_name='Onair')

    def __str__(self):
        return (self.title)

    class Meta:
        verbose_name='Stream'
        verbose_name_plural='Streams'

class Softcam(models.Model):
    name = models.CharField(max_length=50, blank=False, verbose_name='Name')
    name_id = models.CharField(max_length=50, blank=False, verbose_name='ID')
    slug = AutoSlugField(populate_from='name_id')
    host = models.CharField(max_length=50, blank=False, verbose_name='Host')
    port = models.IntegerField(blank=False, verbose_name='Port')
    user = models.CharField(max_length=50, blank=False, verbose_name='User')
    user_pass = models.CharField(max_length=50, blank=False, verbose_name='Pass')
    key  = models.CharField(max_length=28, blank=False, verbose_name='Key')

    def __str__(self):
        return (self.title)

    class Meta:
        verbose_name='Softcam'
        verbose_name_plural='Softcam'
    
