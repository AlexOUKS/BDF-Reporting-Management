# Generated by Django 2.1.2 on 2018-12-10 14:26

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('authBDF', '0038_auto_20181209_2223'),
    ]

    operations = [
        migrations.AlterField(
            model_name='user',
            name='dateCreation',
            field=models.DateTimeField(default=datetime.datetime(2018, 12, 10, 15, 26, 0, 656551)),
        ),
    ]