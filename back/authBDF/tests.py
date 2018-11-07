from django.contrib.auth.models import AnonymousUser, User
from django.test import RequestFactory, TestCase
from authBDF import logics
from django.http import HttpResponse, HttpResponseForbidden, JsonResponse, HttpResponseNotAllowed, HttpResponseBadRequest

import json

class AuthBDFTests(TestCase):
    def setUp(self):
        # Every test needs access to the request factory.
        self.factory = RequestFactory()

         # Create an instance of a GET, POST, DELETE, PUT request.
        self.requestGet = self.factory.get('/authBDF/getUsers')
        self.requestPost = self.factory.post('/authBDF/getUsers')
        self.requestPut = self.factory.put('/authBDF/getUsers')
        self.requestDelete = self.factory.delete('/authBDF/getUsers')

    def test_getUsers(self):
        # Others requests than GET
        self.assertEqual(type(logics.getUsers(self.requestGet)), type(HttpResponse()))
        self.assertEqual(type(logics.getUsers(self.requestPost)),type(HttpResponseForbidden()))
        self.assertEqual(type(logics.getUsers(self.requestPut)),type(HttpResponseForbidden()))
        self.assertEqual(type(logics.getUsers(self.requestDelete)),type(HttpResponseForbidden()))

    def test_editUser(self):
        # Request without body
        self.assertEqual(type(logics.editUser(self.requestPut)), type(HttpResponseBadRequest()))


        # Request with wrong json format
        jsonText = str("{kk : pk)")
        self.requestPut._body = jsonText
        self.assertEqual(type(logics.editUser(self.requestPut)), type(HttpResponseBadRequest()))

        # Request with wrong json inputs
        jsonText = str(json.dumps({"badjson" : "badjson"}))
        self.requestPut._body = jsonText
        self.assertEqual(type(logics.editUser(self.requestPut)), type(HttpResponseBadRequest()))

        # Request with unknown user
        jsonText = str(json.dumps({"login" : "whoknowswhoIam", "mdp" : "mdppp", "niveauAuth" : "1"}))
        self.requestPut._body = jsonText
        self.assertEqual(type(logics.editUser(self.requestPut)), type(HttpResponseBadRequest()))

        # Request with str instead of int in niveauAuth
        jsonText = str(json.dumps({"login" : "user", "mdp" : "mdppp", "niveauAuth" : "niveau"}))
        self.requestPut._body = jsonText
        self.assertEqual(type(logics.editUser(self.requestPut)), type(HttpResponseBadRequest()))

        # Others requests than PUT
        self.assertEqual(type(logics.editUser(self.requestPost)),type(HttpResponseForbidden()))
        self.assertEqual(type(logics.editUser(self.requestGet)),type(HttpResponseForbidden()))
        self.assertEqual(type(logics.editUser(self.requestDelete)),type(HttpResponseForbidden()))  

    def test_deleteUser(self):

        # Request without body
        self.assertEqual(type(logics.deleteUser(self.requestDelete)), type(HttpResponseBadRequest()))


        # Request with wrong json format
        jsonText = str("{kk : pk)")
        self.requestDelete._body = jsonText
        self.assertEqual(type(logics.deleteUser(self.requestDelete)), type(HttpResponseBadRequest()))

        # Request with wrong json inputs
        jsonText = str(json.dumps({"badjson" : "badjson"}))
        self.requestDelete._body = jsonText
        self.assertEqual(type(logics.deleteUser(self.requestDelete)), type(HttpResponseBadRequest()))

        # Request with unknown user
        jsonText = str(json.dumps({"login" : "whoknowswhoIam", "mdp" : "mdppp", "niveauAuth" : "1"}))
        self.requestDelete._body = jsonText
        self.assertEqual(type(logics.deleteUser(self.requestDelete)), type(HttpResponseForbidden()))

        # Others requests than DELETE
        self.assertEqual(type(logics.deleteUser(self.requestPost)),type(HttpResponseForbidden()))
        self.assertEqual(type(logics.deleteUser(self.requestGet)),type(HttpResponseForbidden()))
        self.assertEqual(type(logics.deleteUser(self.requestPut)),type(HttpResponseForbidden()))  

    def test_newUser(self):

        # Request without body
        self.assertEqual(type(logics.newUser(self.requestPost)), type(HttpResponseBadRequest()))


        # Request with wrong json format
        jsonText = str("{kk : pk)")
        self.requestPost._body = jsonText
        self.assertEqual(type(logics.newUser(self.requestPost)), type(HttpResponseBadRequest()))

        # Request with wrong json inputs
        jsonText = str(json.dumps({"badjson" : "badjson"}))
        self.requestPost._body = jsonText
        self.assertEqual(type(logics.newUser(self.requestPost)), type(HttpResponseBadRequest()))

        # Request with str instead of int in niveauAuth
        jsonText = str(json.dumps({"login" : "user", "mdp" : "mdppp", "niveauAuth" : "niveau"}))
        self.requestPost._body = jsonText
        self.assertEqual(type(logics.newUser(self.requestPost)), type(HttpResponseBadRequest()))

        # Others requests than POST
        self.assertEqual(type(logics.newUser(self.requestDelete)),type(HttpResponseForbidden()))
        self.assertEqual(type(logics.newUser(self.requestGet)),type(HttpResponseForbidden()))
        self.assertEqual(type(logics.newUser(self.requestPut)),type(HttpResponseForbidden()))

    def test_login(self):
        # Others requests than POST
        self.assertEqual(type(logics.login(self.requestDelete)),type(HttpResponseForbidden()))
        self.assertEqual(type(logics.login(self.requestGet)),type(HttpResponseForbidden()))
        self.assertEqual(type(logics.login(self.requestPut)),type(HttpResponseForbidden()))

        # Request with wrong json format
        jsonText = str("{kk : pk)")
        self.requestPost._body = jsonText
        self.assertEqual(type(logics.login(self.requestPost)), type(HttpResponseBadRequest()))

        # Request with wrong json inputs
        jsonText = str(json.dumps({"badjson" : "badjson"}))
        self.requestPost._body = jsonText
        self.assertEqual(type(logics.login(self.requestPost)), type(HttpResponseBadRequest()))

        # Request with wrong uers
        jsonText = str(json.dumps({"login" : "badjsonuser", "mdp" : "lool"}))
        self.requestPost._body = jsonText
        self.assertEqual(type(logics.login(self.requestPost)), type(HttpResponseBadRequest()))

        # Others requests than POST
        self.assertEqual(type(logics.newUser(self.requestDelete)),type(HttpResponseForbidden()))
        self.assertEqual(type(logics.newUser(self.requestGet)),type(HttpResponseForbidden()))
        self.assertEqual(type(logics.newUser(self.requestPut)),type(HttpResponseForbidden()))

    def test_random_generator(self):
        self.assertEqual(type(logics.random_generator()),str)
        self.assertEqual(len(logics.random_generator()),6)
