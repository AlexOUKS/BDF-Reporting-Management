from django.db import models
import datetime

class User(models.Model):
    nom = models.CharField(max_length=30)
    mdp  = models.CharField(max_length=30)
    dateCreation = models.DateTimeField(default=datetime.datetime.now())
    dateDerniereConnexion = models.DateTimeField()
# Create your models here.
