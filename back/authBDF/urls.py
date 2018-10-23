from django.urls import path

from . import logics

urlpatterns = [
    path('login', logics.login, name='login'),
]
