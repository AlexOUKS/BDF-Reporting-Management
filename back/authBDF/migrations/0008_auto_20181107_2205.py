# Generated by Django 2.1.2 on 2018-11-07 21:05

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('authBDF', '0007_auto_20181104_1854'),
    ]

    operations = [
        migrations.AlterField(
            model_name='user',
            name='dateCreation',
            field=models.DateTimeField(default=datetime.datetime(2018, 11, 7, 22, 5, 37, 472572)),
        ),
    ]