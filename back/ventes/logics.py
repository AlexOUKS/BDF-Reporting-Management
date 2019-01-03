from django.shortcuts import render
from django.http import HttpResponse, HttpResponseForbidden, JsonResponse, HttpResponseNotAllowed, HttpResponseBadRequest
from ventes.models import *
from validators.validators import Validators

import json

import unicodedata

import hashlib, datetime, json, string, random

listVenteAlreadyExist = []
listNewProduct = []







def load(request):
    if (request.method == "POST"):

        try: # Verification qu'un fichier file est bien présent
            file = request.FILES["file"]
            print("c'est un file")
        except Exception as error:

            print("c'est pas un file")
            return HttpResponseBadRequest(error)
        print(file.content_type)
        print(file)


        if(file.content_type == 'application/vnd.ms-excel'): # Verification du type de fichier
            print("c'est une csv")
            firstLine = file.readline().decode('utf-8')
            secondLine = file.readline().decode('utf-8')
            thirdLine = file.readline().decode('utf-8')
            print(firstLine)
            print(secondLine)
            print(thirdLine)
            lineColonne = file.readline()  # enlever la ligne des noms de colonnes
            fields = ["DATE", "COMPTOIR", "BARMAN", "CLIENT", "ETIQUETTE","QUANTITE","TOTAL","METHODE DE PAIEMENT", "SELLING PRICE", "PURCHASE PRICE", "BENEFIT"]
            lineColonne2 = lineColonne.decode('utf-8')
            lineColonne3 = lineColonne2.split(';')

            i = 0
            for word in lineColonne3:

                wordUp = word.upper()
                wordUpRight = wordUp.replace('\"', "")
                wordUpRightRight = unicodedata.normalize('NFKD', wordUpRight).encode('ascii', 'ignore').strip().decode('utf-8')

                if wordUpRightRight != fields[i]:
                    return HttpResponseBadRequest("le fichier csv n'est pas au bon format")
                i+=1


            o = 3
            ventesNouvellesTotal = 0
            for line in file.readlines():# on balaye tout les lignes du fichier puis on fait les requetes necessaire au remplissage de la BDD

                line2 = line.decode('utf-8')
                line3 = line2.split(';')
                produit = Produit()
                produit.nom = line3[4].replace('\"', "")
                productExist = Produit.objects.filter(nom=produit.nom)

                if Validators.is_not_empty(productExist):
                    #print("produit déjà existant")
                    produit = productExist[0]
                else:
                    produit.prixAchat = line3[-2].replace('\"', "")
                    produit.prixVente = line3[-3].replace('\"', "")
                    produit.save()
                    listNewProduct.append(produit)

                lieuDeVie = LieuDeVie()
                lieuDeVie.nom = line3[1].replace('\"', "")
                lieuDeVieExist = LieuDeVie.objects.filter(nom=lieuDeVie.nom)

                if Validators.is_not_empty(lieuDeVieExist):
                    #print("lieuDeVie déjà existant")
                    lieuDeVie = lieuDeVieExist[0]
                else:
                    #print("existe pas")
                    lieuDeVie.nom = lieuDeVie.nom
                    lieuDeVie.save()

                vente = Vente()
                vente.dateVente = line3[0].replace('\"', "")
                vente.idProduit = produit
                vente.idLieuDeVie = lieuDeVie
                vente.selledBy = line3[2].replace('\"', "")
                vente.purchaseBy = line3[3].replace('\"', "")
                vente.quantite = line3[5].replace('\"', "")
                vente.amount = line3[6].replace('\"', "")
                venteExist = Vente.objects.filter(dateVente = vente.dateVente)
                if Validators.is_not_empty(venteExist):
                    print(o)
                    listVenteAlreadyExist.append(Vente_to_json(vente))

                else :
                    print("vente existe pas")
                    ventesNouvellesTotal += 1
                    vente.save()
                o += 1
            reponse = JsonResponse({"ventesNouvellesTotal" : ventesNouvellesTotal},safe=False)

            """for d in listVenteAlreadyExist:
                listVenteAlreadyExist.remove(d)"""

            return reponse
        else :
            print("c'est pas une csv")
            return HttpResponseBadRequest("Fichier incompatible ! Veuillez upload un fichier CSV")


    else:
        return HttpResponseForbidden("Demande refusée")

def GetVentes(request):
    if(request.method == "GET"):
        ventes = Vente.objects.all()
        ventesJson = [obj.Vente_to_json() for obj in ventes]

        return HttpResponse(json.dumps({"data": ventesJson}), content_type='application/json')

    else:
        return HttpResponseForbidden("Demande refusée")


def getVenteDF(request):
    reponse = []
    if(request.method == "POST"):


        data = Validators.is_valid_json(request.body)

        if data == False:
            print("data false")
            return HttpResponseBadRequest("Probleme data")
        else:
            dateDebut = data["DateDebut"]
            dateFin = data["DateFin"]
            print(dateDebut, dateFin)
            allVente = Vente.objects.all()
            for vente in allVente:
                if dateDebut <= vente.dateVente <= dateFin :
                    reponse.append(Vente_to_json(vente))




        return JsonResponse(reponse, safe= False)
    else:
        print("pas un get")
        return HttpResponseBadRequest("Mauvaise requête")
