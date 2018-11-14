from django.urls import path

from . import logics

urlpatterns = [
    path('getProduits', logics.getProduits, name='getProduits'),
    path('newProduit', logics.newProduit, name='newProduit'),
    path('editProduit', logics.editProduit, name='editProduit'),
    path('deleteProduit', logics.deleteProduit, name='deleteProduit'),
]
