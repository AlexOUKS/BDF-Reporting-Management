from django.db import models
import datetime

class User(models.Model):
    login = models.CharField(max_length=30)
    mdp  = models.CharField(max_length=100)
    dateCreation = models.DateTimeField(default=datetime.datetime.now())
    dateDerniereConnexion = models.DateTimeField()
    niveauAuth = models.CharField(max_length=30, default="1")
    token = models.CharField(max_length=30, default="1")
    grainsel = models.CharField(max_length=100, default="1")

    def to_json(self):
        return {
            "login" : self.login,
            "dateDerniereConnexion" : self.dateDerniereConnexion.strftime("%Y-%m-%d %H:%M:%S"),
            "dateCreation" : self.dateCreation.strftime("%Y-%m-%d %H:%M:%S"),
            "niveauAuth" : self.niveauAuth
        }
