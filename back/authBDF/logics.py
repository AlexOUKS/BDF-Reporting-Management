from django.shortcuts import render
from django.http import HttpResponse, HttpResponseForbidden, JsonResponse, HttpResponseNotAllowed
from authBDF.models import User
from validators.validators import Validators 

import hashlib, datetime, json, string, random

def login(request): 
    if (request.method == "POST"):
        data = json.loads(request.body.decode('utf-8'))
        user = User.objects.filter(login=data['login'])
        if Validators.is_not_empty(user):
            hashmdp = hashlib.md5(data['mdp'].encode()+user[0].grainsel.encode())
            hashmdp = hashmdp.hexdigest()
            if user[0].mdp.lower() == hashmdp.lower():
                user.update(dateDerniereConnexion = datetime.datetime.now())
                return JsonResponse({'etat' : "Connexion réussie", 'lvl' : user[0].niveauAuth})
            else:
                return HttpResponseForbidden("Mauvais indentifiants")
        else:
            return HttpResponseForbidden("Identifiants non existants")
    else:
        return HttpResponseForbidden("Accès refusé")

def newUser(request):
    if (request.method == "POST"):
        if Validators.is_not_empty(request.body.decode('utf-8')):
            data = json.loads(request.body.decode('utf-8'))
            
            fields = ["login", "mdp", "niveauAuth"]
            errors = []

            
            for field in fields:
                if Validators.key_exists(data, field) == False:
                    errors.append(field)

            
            if Validators.is_not_empty(errors):
                return JsonResponse({"Champs manquants : " : json.dumps(errors)})
            
            user = User()
            login = data["login"]
            mdp = data["mdp"]
            niveauAuth = data["niveauAuth"]

            userExist = User.objects.filter(login=login)
            
            if Validators.is_not_empty(userExist):
                return HttpResponseForbidden("Utilisateur déjà existant")

            if Validators.is_not_empty(login):
                user.login = login
            
            if Validators.is_not_empty(mdp):
                randomStr = random_generator()
                grainsel = hashlib.md5(randomStr.encode())
                grainsel = grainsel.hexdigest()
                user.grainsel = grainsel

                mdpHashed = hashlib.md5(mdp.encode()+grainsel.encode())
                user.mdp = mdpHashed.hexdigest()

            if Validators.is_not_empty(niveauAuth):
                try: 
                    int(niveauAuth)
                except ValueError:
                    return HttpResponse("Niveau d'authentification doit être un entier")

                user.niveauAuth = niveauAuth

            user.dateCreation = datetime.datetime.now()
            user.dateDerniereConnexion = datetime.datetime.now()
            user.token = random_generator()
            user.save()

            return JsonResponse({'etat' : "Utilisateur créé"})

        else:
            return HttpResponseForbidden("Accès refusé")




    else:
        return HttpResponseForbidden("Accès refusé")

def deleteUser(request):

    if (request.method == "DELETE"):
        if Validators.is_not_empty(request.body.decode('utf-8')):
            data = json.loads(request.body.decode('utf-8'))
            
            fields = ["login"]
            errors = []

            
            for field in fields:
                if Validators.key_exists(data, field) == False:
                    errors.append(field)

            
            if Validators.is_not_empty(errors):
                return JsonResponse({"Champs manquants : " : json.dumps(errors)})
            
            login = data["login"]

            userExist = User.objects.filter(login=login)
                
            if Validators.is_not_empty(userExist):
                userExist[0].delete()
            else:
                return HttpResponseForbidden("Utilisateur non existant")

            return JsonResponse({'etat' : "Utilisateur supprimé"})

    else:
        return HttpResponseForbidden("Accès refusé")

def editUser(request):
    data = json.loads(request.body.decode('utf-8'))
    if (request.method == "PUT"):
        if Validators.is_not_empty(request.body.decode('utf-8')):
            data = json.loads(request.body.decode('utf-8'))
            
            fields = ["login", "mdp", "niveauAuth"]
            errors = []

            for field in fields:
                if Validators.key_exists(data, field) == False:
                    errors.append(field)

            
            if Validators.is_not_empty(errors):
                return JsonResponse({"Champs manquants : " : json.dumps(errors)})
            
            login = data["login"]
            mdp = data["mdp"]
            niveauAuth = data["niveauAuth"]

            user = User.objects.filter(login=login)
            
            if not Validators.is_not_empty(user):
                return HttpResponseForbidden("Utilisateur non existant")

            user = user[0]

            if Validators.is_not_empty(login):
                user.login = login
            
            if Validators.is_not_empty(mdp):
                randomStr = random_generator()
                grainsel = hashlib.md5(randomStr.encode())
                grainsel = grainsel.hexdigest()
                user.grainsel = grainsel

                mdpHashed = hashlib.md5(mdp.encode()+grainsel.encode())
                user.mdp = mdpHashed.hexdigest()

            if Validators.is_not_empty(niveauAuth):
                try: 
                    int(niveauAuth)
                except ValueError:
                    return HttpResponse("Niveau d'authentification doit être un entier")

                user.niveauAuth = niveauAuth

            user.save()

            return JsonResponse({'etat' : "Utilisateur modifié"})

    else:
        return HttpResponseForbidden("Accès refusé")

def getUsers(request):

    if (request.method == "GET"):
            
        users = User.objects.all()

        usersJson = [ obj.to_json() for obj in users ]

        return HttpResponse(json.dumps({"data": usersJson}), content_type='application/json')
    else:
        return HttpResponseForbidden("Accès refusé")

def random_generator(size=6, chars=string.ascii_uppercase + string.digits):
    return ''.join(random.choice(chars) for x in range(size))
