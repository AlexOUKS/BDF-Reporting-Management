from django.shortcuts import render
from django.http import HttpResponse


def login(request):
    if (request.method == "GET"):
        return HttpResponse("Hello, world. You're at the polls index.")
    else:
        return HttpResponse("Hello.")

# Create your views here.
