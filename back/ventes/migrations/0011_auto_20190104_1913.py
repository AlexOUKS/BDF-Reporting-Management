# Generated by Django 2.1.2 on 2019-01-04 18:13

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('ventes', '0010_vente_quantite'),
    ]

    operations = [
        migrations.AlterField(
            model_name='vente',
            name='dateVente',
            field=models.CharField(max_length=300),
        ),
    ]
