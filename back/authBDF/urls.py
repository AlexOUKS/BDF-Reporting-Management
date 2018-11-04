from django.urls import path

from . import logics

urlpatterns = [
    path('login', logics.login, name='login'),
    path('newUser', logics.newUser, name='newUser'),
    path('deleteUser', logics.deleteUser, name='deleteUser'),
    path('editUser', logics.editUser, name='editUser'),
    path('getUsers', logics.getUsers, name='getUsers'),
]
