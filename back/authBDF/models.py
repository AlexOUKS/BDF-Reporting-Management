from django.db import models
import datetime

class User(models.Model):
    nom = models.CharField(max_length=30)
    mdp  = models.CharField(max_length=100)
    dateCreation = models.DateTimeField(default=datetime.datetime.now())
    dateDerniereConnexion = models.DateTimeField()
    niveauAuth = models.CharField(max_length=30, default="1")
    token = models.CharField(max_length=30, default="1")
    grainsel = models.CharField(max_length=100, default="1")
# Create your models here.
