from django.http import HttpResponse, HttpResponseForbidden, HttpResponseBadRequest, JsonResponse
from validators.validators import Validators 
from authBDF.models import User
import json
import re

class EntryMiddleware:
    def __init__(self, get_response):
        self.get_response = get_response
        # One-time configuration and initialization.

    def __call__(self, request):
        # Code to be executed for each request before
        # the view (and later middleware) are called.

        response = self.get_response(request)
        

        if (request.path != "/authBDF/login" and request.path != "/admin/"):
            
            fields = ["HTTP_AUTHTOKEN"]
            errors = Validators.keys_are_inside_arrays(request.META, fields)
            
            if Validators.is_type(errors, list):
                return HttpResponseBadRequest("Vous devez insérer votre token dans le headers de votre requête")
            
            user = User.objects.filter(token=request.META['HTTP_AUTHTOKEN'])

            
            if Validators.is_not_empty(user) == False:
                return HttpResponseForbidden("Accès refusé, token invalide")

        

        return response