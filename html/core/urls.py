from django.contrib import admin
from django.urls import include, path

from core import views
from .views import *

urlpatterns = [
    path('', Dashboard.as_view(), name='home'),
    path('tables/', Dashboard_table.as_view(), name='tables'),
    path('config/', EditConf.as_view(), name='conf'),
    path('streamadd/', NewStream.as_view(), name='streamadd'),
    path('camadd/', NewSoftcam.as_view(), name='camadd'),
    path('tuneradd/', NewTuner.as_view(), name='tuneradd'),
    path('log/', views.read_file, name='log'),
    path('editstr/<int:pk>', UpdateStream.as_view(), name='editstr'),
    path('edittun/<int:pk>', UpdateTuner.as_view(), name='edittun'),
    path('editcam/<int:pk>', UpdateSoftcam.as_view(), name='editcam'),
    path('delstr/<int:pk>', DelStream.as_view(), name='delstr'),
    path('deltun/<int:pk>', DelTuner.as_view(), name='deltun'),
    path('delcam/<int:pk>', DelSoftcam.as_view(), name='delcam'),
]
