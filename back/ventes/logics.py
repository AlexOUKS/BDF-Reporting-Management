from django.shortcuts import render
from django.http import HttpResponse, HttpResponseForbidden, JsonResponse, HttpResponseNotAllowed, HttpResponseBadRequest
from ventes.models import *
from validators.validators import Validators

import unicodedata

import hashlib, datetime, json, string, random




def load(request):
    if (request.method == "POST"):

        try: # Verification qu'un fichier file est bien présent
            file = request.FILES["file"]
            print("c'est un file")
        except Exception as error:
            print(request.FILES["file"].content_type)
            print("c'est pas un file")
            return HttpResponseBadRequest(error)


        if(file.content_type == 'text/csv'): # Verification du type de fichier
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

                lieuDeVie = LieuDeVie()
                lieuDeVie.nom = line3[1].replace('\"', "")
                lieuDeVieExist = LieuDeVie.objects.filter(nom=lieuDeVie.nom)

                if Validators.is_not_empty(lieuDeVieExist):
                    #print("lieuDeVie déjà existant")
                    lieuDeVie = lieuDeVieExist[0]
                else:
                    #print("existe pas")
                    lieuDeVie = ventes_temp.models.LieuDeVie()
                    lieuDeVie.save()

                vente = Vente()
                vente.dateVente = line3[0].replace('\"', "")
                vente.idProduit = produit
                vente.idLieuDeVie = lieuDeVie
                vente.selledBy = line3[2].replace('\"', "")
                vente.purchaseBy = line3[3].replace('\"', "")
                vente.pruchaseBy = line3[5].replace('\"', "")
                vente.amount = line3[6].replace('\"', "")
                #vente.save()

            return HttpResponse(vente)
        else :
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
