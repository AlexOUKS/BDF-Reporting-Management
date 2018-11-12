from django.shortcuts import render
from django.http import HttpResponse, HttpResponseForbidden, JsonResponse, HttpResponseNotAllowed, HttpResponseBadRequest
from ventes.models import Vente
from validators.validators import Validators

import hashlib, datetime, json, string, random


def load(request):
    if (request.method == "POST"):
        file = request.FILES["file"]
        if(file.content_type == 'text/csv'):
            firstLine = file.readline().decode('utf-8')
            secondLine = file.readline().decode('utf-8')
            thirdLine = file.readline().decode('utf-8')
            print(firstLine)
            print(secondLine)
            print(thirdLine)
            file.readline() # enlever la ligne des noms de colonnes
            Date  = Barman = Client = Etiquette = Quantité = Total = MéthodePaiment = SellingPrice = PurchasePrice = Benefit = ""
            Comptoir = ""
            for line in file.readlines():
                line2 = line.decode('utf-8')
                i=0
                while line2[i] != ';':
                    if (line2[i] != '\"'):
                        #print (line2[i])
                        Date += line2[i]
                    i+=1
                i+=2


                while line2[i] != ';':
                    if (line2[i] != '\"'):
                        #print (line2[i])
                        Comptoir += line2[i]
                    i+=1
                i += 2


                while line2[i] != ';':
                    if (line2[i] != '\"'):
                        #print (line2[i])
                        Barman += line2[i]
                    i+=1
                i += 2
                while line2[i] != ';':
                    if (line2[i] != '\"'):
                        #print (line2[i])
                        Client += line2[i]
                    i+=1
                i += 2
                while line2[i] != ';':
                    if (line2[i] != '\"'):
                        #print (line2[i])
                        Etiquette += line2[i]
                    i+=1
                i += 2

                while line2[i] != ';':
                    if (line2[i] != '\"'):
                        #print (line2[i])
                        Quantité += line2[i]
                    i+=1
                i += 2

                while line2[i] != ';':
                    if (line2[i] != '\"'):
                        #print (line2[i])
                        Total += line2[i]
                    i+=1
                i += 2

                while line2[i] != ';':
                    if (line2[i] != '\"'):
                        #print (line2[i])
                        MéthodePaiment += line2[i]
                    i+=1
                i += 2

                while line2[i] != ';':
                    if (line2[i] != '\"'):
                        #print (line2[i])
                        SellingPrice += line2[i]
                    i+=1
                i += 2

                while line2[i] != ';':
                    if (line2[i] != '\"'):
                        #print (line2[i])
                        PurchasePrice += line2[i]
                    i+=1
                i += 2

                while i < len(line2):
                    if (line2[i] != '\"'):
                        #print (line2[i])
                        Benefit += line2[i]
                    i+=1
                print("Date =" + Date)
                print("Comptoir =" + Comptoir)
                print("Barman =" + Barman)
                print("Client =" + Client)
                print("Etiquette =" + Etiquette)
                print("Quantité =" + Quantité)
                print("Total =" + Total)
                print("MéthodePaiment =" + MéthodePaiment)
                print("SellingPrice =" + SellingPrice)
                print("PurchasePrice =" + PurchasePrice)
                print("Benefit =" + Benefit)

                #Puis mettre requete pour remplir la BDD





                return HttpResponse(Comptoir)









    else:
        return HttpResponseForbidden("Demande refusée")
