# Generated by Django 2.1.2 on 2019-01-03 18:11

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('authBDF', '0043_auto_20190103_1911'),
    ]

    operations = [
        migrations.AlterField(
            model_name='user',
            name='dateCreation',
            field=models.DateTimeField(default=datetime.datetime(2019, 1, 3, 19, 11, 50, 368391)),
        ),
    ]