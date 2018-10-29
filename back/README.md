# BDF-Reporting-Management API

This is API is designed for managing the intern needs of an association called "Le Bureau des Festivités" from the University of Technology of Belfort-Montbeliard. It used Python as main language and the framework Django. This also a project for our project course TO52.

<img src="https://github.com/AlexOUKS/BDF-Reporting-Management/blob/master/front/src/img/bdf.jpg" width="350" title="hover text" align="center">


Table of contents
=================
<!--ts-->
* [BDF-Reporting-Management API](#API-BEF)
* [Getting Started](#getting-started)
    * [Prerequisites](#prerequisites)
        * [Python](#python)
        * [Django](#django)
        * [Dependencies](#dependencies)
        * [PostgreSQL](#postgresql)
        * [BDF-Reporting-Management API](#bdf-reporting-management)
    * [Quick start](#quick-start)
* [How does it work?](#how-does-it-work)
* [Tests](#tests)
* [Authors](#authors)
<!--te-->

## Getting Started
These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

#### Python

You need Python 3.4 or later to run our Django project. We advise you always to take the lastest version.

In Ubuntu, Mint and Debian you can install Python 3 like this:

`$ sudo apt-get install python3 python3-pip`

For other Linux flavors, OS X and Windows, packages are available at:

[http://www.python.org/getit/](http://www.python.org/getit/)


#### Django

**Install Django from PiP in your virtual environment (recommended):**

```sudo pip install keras```

**Install Django for Windows user:**

For installing Django on Windows, follow this link: [https://docs.djangoproject.com/en/2.1/howto/windows/](https://docs.djangoproject.com/en/2.1/howto/windows/)

#### Depedencies

For installing all the packages needed to run our API, run this command in the root of our API repository :

```pip install -r requirements.txt```

#### PostgreSQL

We are using PostgreSQL as main database system, you can install locally PostgreSQL and gives your local credentials to connect to your database :

For installing PostgreSQL, follow this link: [https://www.postgresql.org/download/](https://www.postgresql.org/download/)

To put the credentials of your database :

1. Open the file **settings.py** in toProject repository
2. Put your credentials in the environment variables

    ```
    os.environ["DATABASE_HOST"] = "yourhost"
    os.environ["DATABASE_PORT"] = "yourport"
    os.environ["DATABASE_NAME"] = "yourname"
    os.environ["DATABASE_USER"] = "youruser"
    os.environ["DATABASE_PASSWORD"] = "yourpassword"
    ```

#### BDF-Reporting-Management API

Clone this project with git, use the command : `git clone https://github.com/AlexOUKS/BDF-Reporting-Management`

OR

Download it directly from the GitHub page

### Quick start

To start a program go to the directory where the API files are located and execute thoses commands:

1. To create the mapping between models and database :
`
$ python manage.py makemigrations
`
2. To launch your API on your environment :
`
$ python manage.py runserver
`

## How does it work

Incoming...

## Tests

Incoming...


## Authors

1. [Aurélien Broutin](https://github.com/AurelienBroutin)
2. [Alexis Ouksel](https://github.com/AlexOUKS)

[To the top!](#sudoku-solver)