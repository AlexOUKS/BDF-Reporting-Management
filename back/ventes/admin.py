from django.contrib import admin

# Register your models here.
from .models import Produit, Vente, LieuDeVie, CategorieProduit, MethodePaiement


admin.site.register(Produit)
admin.site.register(Vente)
admin.site.register(LieuDeVie)
admin.site.register(CategorieProduit)
admin.site.register(MethodePaiement)