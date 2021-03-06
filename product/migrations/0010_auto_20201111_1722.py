# -*- coding: utf-8 -*-
# Generated by Django 1.11.8 on 2020-11-11 09:22
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('product', '0009_auto_20201111_1451'),
    ]

    operations = [
        migrations.CreateModel(
            name='OrderDetailModel',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('orderid', models.CharField(max_length=16, verbose_name='訂單編號')),
                ('pname', models.CharField(default='', max_length=100, verbose_name='商品名稱')),
                ('price', models.IntegerField(default=0, verbose_name='商品單價')),
                ('amount', models.IntegerField(default=1, verbose_name='商品數量')),
                ('total', models.IntegerField(default=0, verbose_name='商品總價')),
            ],
        ),
        migrations.RemoveField(
            model_name='ordermodel',
            name='productid',
        ),
        migrations.AddField(
            model_name='ordermodel',
            name='alltotal',
            field=models.IntegerField(default=0, verbose_name='訂單總價'),
        ),
    ]
