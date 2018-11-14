from django.db import models
import datetime

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

class LieuDeVie(models.Model):
    id = models.AutoField(primary_key = True)
    alt = models.CharField(max_length=30)
    nom= models.CharField(max_length = 30)


class MethodePaiement(models.Model):
    id = models.AutoField(primary_key = True)
    alt = models.CharField(max_length=30)
    nom= models.CharField(max_length = 30)

class Vente(models.Model):
    id = models.AutoField(primary_key = True)
    dateVente = models.DateTimeField()
    idProduit = models.OneToOneField(Produit, on_delete = models.CASCADE)
    idMethodePaiement = models.OneToOneField(MethodePaiement, on_delete = models.CASCADE)
    idLieuDeVie = models.OneToOneField(LieuDeVie, on_delete = models.CASCADE)
    alt = models.CharField(max_length=30)
    selledBy = models.CharField(max_length = 30)
    purchaseBy = models.CharField(max_length = 30)
    amount = models.IntegerField()










