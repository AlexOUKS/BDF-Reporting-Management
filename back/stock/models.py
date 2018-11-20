from django.db import models

# Create your models here.
class CategorieProduit(models.Model):
    id = models.AutoField(primary_key = True)
    nom= models.CharField(max_length = 30)
    alt = models.CharField(max_length=30)
    colorGraph = models.CharField(max_length=30, default="#ffffff")

    def to_json(self):
        return {
            "id" : self.id,
            "nom" : self.nom,
            "alt" : self.alt,
            "colorGraph" : self.colorGraph
        }

class Produit(models.Model):
    id = models.AutoField(primary_key = True)
    idCategorieProduit = models.ForeignKey(CategorieProduit, on_delete = models.CASCADE)
    nom= models.CharField(max_length = 30)
    alt = models.CharField(max_length=30)
    prixAchat = models.IntegerField()
    prixVente = models.IntegerField()
    disponible = models.BooleanField()
    quantite = models.IntegerField()

    def to_json(self):
        return {
            "id" : self.id,
            "categorieProduit" : self.idCategorieProduit.to_json(),
            "nom" : self.nom,
            "alt" : self.alt,
            "prixAchat" : self.prixAchat,
            "prixVente" : self.prixVente,
            "disponible" : self.disponible,
            "quantite" : self.quantite
        }
