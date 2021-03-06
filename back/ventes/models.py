from django.db import models
import datetime

class CategorieProduit(models.Model):
    id = models.AutoField(primary_key = True)
    nom= models.CharField(max_length = 30)
    alt = models.CharField(max_length=30)

class Produit(models.Model):
    id = models.AutoField(primary_key = True)
    nom= models.CharField(max_length = 300)
    alt = models.CharField(max_length=300)
    prixAchat = models.FloatField()
    prixVente = models.FloatField()


class LieuDeVie(models.Model):
    id = models.AutoField(primary_key = True)
    alt = models.CharField(max_length=30)
    nom= models.CharField(max_length = 30)


class Vente(models.Model):
    id = models.AutoField(primary_key = True)
    dateVente = models.CharField(max_length = 300)
    idProduit = models.ForeignKey(Produit, on_delete = models.CASCADE)
    idLieuDeVie = models.ForeignKey(LieuDeVie, on_delete = models.CASCADE)
    alt = models.CharField(max_length=30)
    selledBy = models.CharField(max_length = 300)
    purchaseBy = models.CharField(max_length = 300)
    amount = models.FloatField()
    quantite = models.IntegerField(default=1)


def Vente_to_json(self):
    return {
        "dateVente": self.dateVente,
        "produit" : self.idProduit.nom,
        "lieuDeVie" : self.idLieuDeVie.nom,
        "selledBy" : self.selledBy,
        "purchaseBy" : self.purchaseBy,
        "amount" : self.amount,
        "quantité" : self.quantite
    }







