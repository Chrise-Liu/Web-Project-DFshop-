# -*- coding: utf-8 -*-
# Generated by Django 1.11.8 on 2020-11-05 01:31
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('user', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='usermodel',
            name='password',
            field=models.CharField(max_length=32),
        ),
    ]
