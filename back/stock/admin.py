from django.contrib import admin

# Register your models here.
from .models import Produit, CategorieProduit

admin.site.register(Produit)
admin.site.register(CategorieProduit)