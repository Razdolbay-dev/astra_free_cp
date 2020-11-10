from django import forms 
from .models import *

class NewStreamForm(forms.ModelForm):
    class Meta:
        model = Stream
        fields = '__all__'

class NewSoftcamForm(forms.ModelForm):
    class Meta:
        model = Softcam
        fields = '__all__'

class NewTunerForm(forms.ModelForm):
    class Meta:
        model = Tuner
        fields = '__all__'