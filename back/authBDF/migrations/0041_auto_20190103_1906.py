# Generated by Django 2.1.2 on 2019-01-03 18:06

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('authBDF', '0040_auto_20190103_1541'),
    ]

    operations = [
        migrations.AlterField(
            model_name='user',
            name='dateCreation',
            field=models.DateTimeField(default=datetime.datetime(2019, 1, 3, 19, 6, 44, 912772)),
        ),
    ]
