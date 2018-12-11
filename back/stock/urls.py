from django.urls import path

from . import logics

urlpatterns = [
    path('getProduits', logics.getProduits, name='getProduits'),
    path('newProduit', logics.newProduit, name='newProduit'),
    path('editProduit', logics.editProduit, name='editProduit'),
    path('deleteProduit', logics.deleteProduit, name='deleteProduit'),
    path('deleteCategorieProduit', logics.deleteCategorieProduit, name='deleteCategorieProduit'),
    path('newCategorieProduit', logics.newCategorieProduit, name='newCategorieProduit'),
    path('editCategorieProduit', logics.editCategorieProduit, name='editCategorieProduit'),
]
