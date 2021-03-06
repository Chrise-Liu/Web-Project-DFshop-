# -*- coding: utf-8 -*-
# Generated by Django 1.11.8 on 2020-11-09 02:46
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('product', '0004_auto_20201107_1647'),
    ]

    operations = [
        migrations.CreateModel(
            name='CartModel',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('productid', models.CharField(max_length=16, verbose_name='商品id')),
                ('username', models.CharField(max_length=32, verbose_name='用戶名稱')),
                ('amount', models.IntegerField(default=1, verbose_name='商品數量')),
                ('price', models.IntegerField(default=0, verbose_name='商品單價')),
                ('total', models.IntegerField(default=0, verbose_name='商品總價')),
            ],
        ),
    ]
