from django.urls import path

from . import logics

urlpatterns = [
    path('load', logics.load, name='load'),
    path('getVenteDF', logics.getVenteDF, name='getVenteDF'),

]