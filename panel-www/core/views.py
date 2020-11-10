from django.shortcuts import render, redirect
from django.urls import reverse, reverse_lazy
from django.contrib import messages
from django.views.generic import *
from django.contrib.auth.views import LoginView, LogoutView
from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login
from django.contrib.auth.mixins import LoginRequiredMixin
from django.http import HttpResponse, JsonResponse
from django.core import serializers

import os
import json
from .models import *
from .forms import *

# Create your views here.

class CustomSuccessMessageMixin:
    @property
    def success_msg(self):
        return False
    def form_valid(self,form):
        messages.success(self.request, self.success_msg)
        return super().form_valid(form)
    def get_success_url(self):
        return '%s?id=%s' % (self.success_url, self.object.id)


class Dashboard(TemplateView):
    template_name = 'index.html'
    def get_context_data(self, **kwargs):
        context = super(Dashboard, self).get_context_data(**kwargs)
        context['list_tuner'] = Tuner.objects.all()
        context['list_strm'] = Stream.objects.all()
        context['list_cam'] = Softcam.objects.all()
        return context

#Добавление
class NewStream(CustomSuccessMessageMixin, CreateView):
    model = Stream
    template_name = 'stream.html'
    form_class = NewStreamForm
    success_url = reverse_lazy('home')
    success_msg = 'Поток добавлен'
    
class NewSoftcam(CustomSuccessMessageMixin, CreateView):
    model = Softcam
    template_name = 'softcam.html'
    form_class = NewSoftcamForm
    success_url = reverse_lazy('home')
    success_msg = 'Софткам добавлен'
    
class NewTuner(CustomSuccessMessageMixin, CreateView):
    model = Tuner
    template_name = 'tuner.html'
    form_class = NewTunerForm
    success_url = reverse_lazy('home')
    success_msg = 'Тюнер добавлен'

# Обновление настроек
class UpdateStream(CustomSuccessMessageMixin, UpdateView):
    model = Stream
    template_name = 'stream.html'
    form_class = NewStreamForm
    success_url = reverse_lazy('home')
    success_msg = 'Поток успешно обновлен'

class UpdateTuner(CustomSuccessMessageMixin, UpdateView):
    model = Tuner
    template_name = 'tuner.html'
    form_class = NewTunerForm
    success_url = reverse_lazy('home')
    success_msg = 'Тюнер успешно обновлен'

class UpdateSoftcam(CustomSuccessMessageMixin, UpdateView):
    model = Softcam
    template_name = 'softcam.html'
    form_class = NewSoftcamForm
    success_url = reverse_lazy('home')
    success_msg = 'Софткам успешно обновлен'

# Удаление
class DelStream(DeleteView):
    model = Stream
    template_name = 'stream.html'
    success_url = reverse_lazy('home')
    success_msg = 'Поток удален'

    def post(self,request,*args,**kwargs):
        messages.success(self.request, self.success_msg)
        return super().post(request)

class DelTuner(DeleteView):
    model = Tuner
    template_name = 'tuner.html'
    success_url = reverse_lazy('home')
    success_msg = 'Тюнер удален'

    def post(self,request,*args,**kwargs):
        messages.success(self.request, self.success_msg)
        return super().post(request)

class DelSoftcam(DeleteView):
    model = Softcam
    template_name = 'softcam.html'
    success_url = reverse_lazy('home')
    success_msg = 'Софткам удален'

    def post(self,request,*args,**kwargs):
        messages.success(self.request, self.success_msg)
        return super().post(request)
# Прочие функции

def read_file(request):
    f = open('/var/log/astra.log')
    file_content = f.read()
    #os.system("/etc/init.d/astra4 stop")
    context = {
        'file_content': file_content
        }
    return render(request, 'log.html', context)

class EditConf(TemplateView):
    template_name = 'config.html'
    def get_context_data(self, **kwargs):
        context = super(EditConf, self).get_context_data(**kwargs)
        context['list_tuner'] = Tuner.objects.all()
        context['list_strm'] = Stream.objects.all()
        context['list_cam'] = Softcam.objects.all()
        return context

def send_json(request):

    tuners = list(Tuner.objects.values('dvb_id', 'adapter_id', 'signal_type', 'frequency', 'polarization', 'symbolrate' ))
    channels = list(Stream.objects.values('title', 'input', 'output', 'enable' ))
    softcam = list(Softcam.objects.values('name_id', 'name', 'host', 'port', 'user', 'user_pass', 'key' ))
    
    return JsonResponse({'tuners': list(tuners),
                         'channels': list(channels),
                         'softcam': list(softcam)
    })
