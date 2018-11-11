from django.shortcuts import render
from django.http import HttpResponse, HttpResponseForbidden, JsonResponse, HttpResponseNotAllowed, HttpResponseBadRequest
from ventes.models import Vente
from validators.validators import Validators

import hashlib, datetime, json, string, random


def load(request):
    if (request.method == "POST"):
        file = request.FILES["file"]
        file2 = file
        fileLines=file2.readlines()
        if(file.content_type == 'text/csv'):
            firstLine = file.readline().decode('utf-8')
            print(firstLine)
            secondLine = file.readline().decode('utf-8')
            thridLine = file.readline().decode('utf-8')
            #return HttpResponse(file.readline())
            line= ""
            print(len(fileLines)-1)
            for i in range(3,len(fileLines)-1): # i est un type bytes (tableau d'array), need to decode
                line = file.readline().decode('utf-8') # i2 est un type str

#traiter les lignes
            #for chunk in file.chunks():
            return HttpResponse(line)




    else:
        return HttpResponseForbidden("Demande refusée")
