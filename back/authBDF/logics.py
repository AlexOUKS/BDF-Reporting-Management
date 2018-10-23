from django.shortcuts import render
from django.http import HttpResponse, HttpResponseForbidden
from authBDF.models import User
import json


def login(request):
    data = json.loads(request.body.decode('utf-8'))
    if (request.method == "POST"):
        user = User.objects.filter(nom=data['login']).filter(mdp=data['mdp'])
        if user:
            return HttpResponse("ok")
        else:
            return HttpResponseForbidden("nope")
    else:
        return HttpResponse("Hello.")



   

# Create your views here.
