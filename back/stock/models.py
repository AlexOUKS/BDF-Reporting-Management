from django.db import models

# Create your models here.
class CategorieProduit(models.Model):
    id = models.AutoField(primary_key = True)
    nom= models.CharField(max_length = 30)
    alt = models.CharField(max_length=30)

class Produit(models.Model):
    id = models.AutoField(primary_key = True)
    idCategorieProduit = models.ForeignKey(CategorieProduit, on_delete = models.CASCADE)
    nom= models.CharField(max_length = 30)
    alt = models.CharField(max_length=30)
    prixAchat = models.IntegerField()
    prixVente = models.IntegerField()
    disponible = models.BooleanField()
