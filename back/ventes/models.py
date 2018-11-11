from django.db import models
import datetime

class Vente(models.Model):
    id = models.AutoField(primary_key = True)
    dateVente = models.DateTimeField()
    idProduit = models.OneToOneField(Produit, on_delete = models.CASCADE)
    idMethodePaiement = models.OneToOneField(MethodePaiement, on_delete = models.CASCADE)
    idLieuDeVie = models.OneToOneField(LieuDeVie, on_delete = models.CASCADE)
    alt = models.CharField(max_length=30)
    selledBy = models.CharField(max_length = 30)


class Produit(models.Model):
    id = models.AutoField(primary_key = True)
    idCategorieProduit = models.ForeignKey(CategorieProduit, on_delete = models.CASCADE)
    nom= models.CharFields(max_length = 30)
    alt = models.CharField(max_length=30)
    prixAchat = models.IntegerField()
    prixVente = models.IntegerFiled()
    disponible = models.BooleanFields()


class CategorieProduit(models.Model):
    id = models.AutoField(primary_key = True)
    nom= models.CharFields(max_length = 30)
    alt = models.CharField(max_length=30)


class LieuDeVie(models.Model):
    id = models.AutoField(primary_key = True)
    alt = models.CharField(max_length=30)
    nom= models.CharFields(max_length = 30)


class MethodePaiement(models.Model):
    id = models.AutoField(primary_key = True)
    alt = models.CharField(max_length=30)
    nom= models.CharFields(max_length = 30)

