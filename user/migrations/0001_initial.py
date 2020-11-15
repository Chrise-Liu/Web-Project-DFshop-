# -*- coding: utf-8 -*-
# Generated by Django 1.11.8 on 2020-11-04 12:56
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='UserModel',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('email', models.EmailField(blank=True, default='', max_length=100)),
                ('password', models.CharField(max_length=20)),
                ('username', models.CharField(max_length=20)),
                ('sex', models.CharField(max_length=2)),
                ('phone', models.CharField(blank=True, default='', max_length=50)),
                ('addr', models.CharField(blank=True, default='', max_length=255)),
            ],
        ),
    ]
