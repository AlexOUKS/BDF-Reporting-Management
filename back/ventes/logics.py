from django.shortcuts import render
from django.http import HttpResponse, HttpResponseForbidden, JsonResponse, HttpResponseNotAllowed, HttpResponseBadRequest
from ventes.models import *
from validators.validators import Validators

import hashlib, datetime, json, string, random


def load(request):
    if (request.method == "POST"):
        try:
            file = request.FILES["file"]
        except Exception as error:
            return HttpResponseBadRequest(error)

        if(file.content_type == 'text/csv'):
            firstLine = file.readline().decode('utf-8')
            secondLine = file.readline().decode('utf-8')
            thirdLine = file.readline().decode('utf-8')
            print(firstLine)
            print(secondLine)
            print(thirdLine)
            file.readline()  # enlever la ligne des noms de colonnes

            for line in file.readlines():
                line2 = line.decode('utf-8')
                line3 = line2.split(';')

                produit = Produit()
                produit.nom = line3[4].replace('\"', "")

                productExist = Produit.objects.filter(nom=produit.nom)

                if Validators.is_not_empty(productExist):
                    print("produit déjà existant")
                    produit = productExist
                else:
                    produit.prixAchat = line3[-2].replace('\"', "")
                    produit.prixVente = line3[-3].replace('\"', "")
                    produit.save()

                methodePaiment = MethodePaiement()
                methodePaiment.nom = line3[-4].replace('\"', "")
                methodePaimentExist = MethodePaiement.objects.filter(nom=methodePaiment.nom)

                if Validators.is_not_empty(methodePaimentExist):
                    print("methodePaiment déjà existant")
                    methodePaiment = methodePaimentExist
                else:
                    print("existe pas")
                    methodePaiment.save()

                lieuDeVie = LieuDeVie()
                lieuDeVie.nom = line3[1].replace('\"', "")
                lieuDeVieExist = MethodePaiement.objects.filter(nom=lieuDeVie.nom)

                if Validators.is_not_empty(lieuDeVieExist):
                    print("lieuDeVie déjà existant")
                    lieuDeVie = lieuDeVieExist # suffisant ou copie point par point necessaire ?
                else:
                    print("existe pas")
                    lieuDeVie.save()

                vente = Vente()
                vente.dateVente = line3[0].replace('\"', "")
                vente.idProduit = produit.id
                vente.idMethodePaiement = methodePaiment.id
                vente.idLieuDeVie = lieuDeVie.id
                vente.selledBy = line3[2].replace('\"', "")
                vente.purchaseBy = line3[3].replace('\"', "")
                vente.pruchaseBy = line3[5].replace('\"', "")

                vente.save()

                return HttpResponse(vente)
        return HttpResponseBadRequest("Fichier incompatible ! Veuillez upload un fichier CSV")
    else:
        return HttpResponseForbidden("Demande refusée")
