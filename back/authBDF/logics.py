from django.shortcuts import render
from django.http import HttpResponse, HttpResponseForbidden, JsonResponse
from authBDF.models import User
import json
import datetime
import hashlib

def login(request):
    data = json.loads(request.body.decode('utf-8'))
    if (request.method == "POST"):
        user = User.objects.filter(nom=data['login'])
        if user:
            hashmdp = hashlib.md5(data['mdp'].encode()+user[0].grainsel.encode())
            hashmdp = hashmdp.hexdigest()
            if user[0].mdp.lower() == hashmdp.lower():
                user.update(dateDerniereConnexion = datetime.datetime.now())
                return JsonResponse({'etat' : "Connexion réussie", 'lvl' : user[0].niveauAuth})
            else:
                return HttpResponseForbidden("Mauvais indentifiants")
        else:
            return HttpResponseForbidden("Mauvais indentifiants")
    else:
        return HttpResponseForbidden("Accès refusé")



   

# Create your views here.
