# Generated by Django 2.2.6 on 2019-11-21 12:39

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('construction', '0006_auto_20191121_1238'),
    ]

    operations = [
        migrations.AlterField(
            model_name='transactions',
            name='amount',
            field=models.DecimalField(decimal_places=2, max_digits=12),
        ),
    ]
