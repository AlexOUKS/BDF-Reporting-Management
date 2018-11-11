from django.shortcuts import render
from django.http import HttpResponse, HttpResponseForbidden, JsonResponse, HttpResponseNotAllowed, HttpResponseBadRequest
from ventes.models import Vente
from validators.validators import Validators

import hashlib, datetime, json, string, random


def load(request):
    if (request.method == "POST"):
        if(request.FILES.content_type == 'csv'):




    else:
        return HttpResponseForbidden("Demande refusée")
