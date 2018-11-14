from stock.models import Produit, CategorieProduit
from validators.validators import Validators 
from django.http import HttpResponse, HttpResponseForbidden, JsonResponse, HttpResponseNotAllowed, HttpResponseBadRequest

import hashlib, datetime, json, string, random

def getProduits(request):
    if (request.method == "GET"):
            
        produits = Produit.objects.all()

        produitsJson = [ obj.to_json() for obj in produits ]

        return HttpResponse(json.dumps({"data": produitsJson}), content_type='application/json')
    
    return HttpResponseForbidden("Accès refusé")

def newProduit(request):
    if (request.method == "POST"):
        if Validators.is_not_empty(request.body):   

            data = Validators.is_valid_json(request.body)
            if data == False:
                return HttpResponseBadRequest("Le JSON dans le corps de votre requête est mal formaté")
            
            fields = ["categorieProduit", "nom", "prixAchat", "prixVente", "disponible"]
            errors = Validators.keys_are_inside_arrays(data, fields)
            
            if Validators.is_type(errors, list):
                return HttpResponseBadRequest("Champs manquants : " + json.dumps(errors))
            
            produit = Produit()
            categorieProduit = data["categorieProduit"]
            nom = data["nom"]
            prixAchat = data["prixAchat"]
            prixVente = data["prixVente"]
            disponible = data["disponible"]

            produitExist = Produit.objects.filter(nom=nom)
            
            if Validators.is_not_empty(produitExist):
                return HttpResponseBadRequest("Produit déjà existant")
            
            if Validators.is_not_empty(categorieProduit):
                try:
                    int(categorieProduit)
                except ValueError:
                    return HttpResponseBadRequest("Catégorie de produit doit être une clé primaire et un entier")

                categorieProduitExist = CategorieProduit.objects.filter(pk=categorieProduit)

                if Validators.is_not_empty(categorieProduitExist) == False:
                    return HttpResponseBadRequest("Catégorie de produit non existante")

                produit.idCategorieProduit = categorieProduitExist[0]

            else:
                return HttpResponseBadRequest("Champ catégorie produit vide")

            if Validators.is_not_empty(nom) & Validators.is_not_empty(prixAchat) & Validators.is_not_empty(prixVente) & Validators.is_not_empty(disponible):
                produit.nom = nom
                produit.prixAchat = prixAchat
                produit.prixVente = prixVente
                produit.alt = nom.lower()
                if (disponible.lower() == "false"):
                    produit.disponible = False
                elif (disponible.lower() == "true"):
                    produit.disponible = True
                else:
                    produit.disponible = True
            else:
                return HttpResponseBadRequest("Un des champs est vide")
            
            
            
            produit.save()

            return JsonResponse({'etat' : "Produit créé"})
        else:
            return HttpResponseBadRequest("Vous n'avez pas mis de corps à votre requête")

    return HttpResponseForbidden("Accès refusé")

def editProduit(request):
    
    if (request.method == "PUT"):
        if Validators.is_not_empty(request.body):
            data = Validators.is_valid_json(request.body)
            if data == False:
                return HttpResponseBadRequest("Le JSON dans le corps de votre requête est mal formaté")
            
            fields = ["id", "categorieProduit", "nom", "prixAchat", "prixVente", "disponible"]
            errors = Validators.keys_are_inside_arrays(data, fields)
            
            if Validators.is_type(errors, list):
                return HttpResponseBadRequest("Champs manquants : " + json.dumps(errors))
            
            produit = Produit()
            categorieProduit = data["categorieProduit"]
            id = data["id"]
            nom = data["nom"]
            prixAchat = data["prixAchat"]
            prixVente = data["prixVente"]
            disponible = data["disponible"]

            produit = Produit.objects.filter(pk=id)
            
            if not Validators.is_not_empty(produit):
                return HttpResponseBadRequest("Produit non existant")

            produit = produit[0]

            if Validators.is_not_empty(categorieProduit):
                try:
                    int(categorieProduit)
                except ValueError:
                    return HttpResponseBadRequest("Catégorie de produit doit être une clé primaire et un entier")

                categorieProduitExist = CategorieProduit.objects.filter(pk=categorieProduit)

                if Validators.is_not_empty(categorieProduitExist) == False:
                    return HttpResponseBadRequest("Catégorie de produit non existante")

                produit.idCategorieProduit = categorieProduitExist[0]

            else:
                return HttpResponseBadRequest("Champ catégorie produit vide")

            if Validators.is_not_empty(nom) & Validators.is_not_empty(prixAchat) & Validators.is_not_empty(prixVente) & Validators.is_not_empty(disponible):
                produit.nom = nom
                produit.prixAchat = prixAchat
                produit.prixVente = prixVente
                produit.alt = nom.lower()
                if (disponible.lower() == "false"):
                    produit.disponible = False
                elif (disponible.lower() == "true"):
                    produit.disponible = True
                else:
                    produit.disponible = True
            else:
                return HttpResponseBadRequest("Un des champs est vide")

            produit.save()

            return JsonResponse({'etat' : "Produit modifié"})
        else:
            return HttpResponseBadRequest("Vous n'avez pas mis de corps à votre requête")
    else:
        return HttpResponseForbidden("Accès refusé")

def deleteProduit(request):

    if (request.method == "DELETE"):
        if Validators.is_not_empty(request.body):
            data = Validators.is_valid_json(request.body)
            if data == False:
                return HttpResponseBadRequest("Le JSON dans le corps de votre requête est mal formaté")
            
            fields = ["id"]
            errors = Validators.keys_are_inside_arrays(data, fields)
            
            if Validators.is_type(errors, list):
                return HttpResponseBadRequest("Champs manquants : " + json.dumps(errors))
            
            id = data["id"]

            produit = Produit.objects.filter(pk=id)
            
            if not Validators.is_not_empty(produit):
                return HttpResponseBadRequest("Produit non existant")
                
            produit[0].delete()

            return JsonResponse({'etat' : "Produit supprimé"})
        else:
            return HttpResponseBadRequest("Vous n'avez pas mis de corps à votre requête")
     
    return HttpResponseForbidden("Accès refusé")