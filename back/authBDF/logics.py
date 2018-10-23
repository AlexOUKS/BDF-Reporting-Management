from django.shortcuts import render
from django.http import HttpResponse, HttpResponseForbidden
from authBDF.models import User
import json
import datetime

def login(request):
    data = json.loads(request.body.decode('utf-8'))
    if (request.method == "POST"):
        user = User.objects.filter(nom=data['login']).filter(mdp=data['mdp'])
        if user:
            user.update(dateDerniereConnexion = datetime.datetime.now())
            return HttpResponse("Connexion réussie")
        else:
            return HttpResponseForbidden("Mauvais indentifiants")
    else:
        return HttpResponseForbidden("Accès refusé")



   

# Create your views here.
