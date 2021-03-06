# -*- coding: utf-8 -*-
# Generated by Django 1.9.8 on 2018-04-25 17:11
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Goods',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('goods_title', models.CharField(max_length=50, verbose_name='\u6807\u9898')),
                ('price', models.CharField(max_length=20, verbose_name='\u4ef7\u683c')),
                ('oprice', models.CharField(max_length=20, verbose_name='\u539f\u4ef7')),
                ('address', models.CharField(max_length=50, verbose_name='\u5730\u5740')),
                ('phone', models.CharField(max_length=11, verbose_name='\u624b\u673a\u53f7')),
                ('description', models.CharField(max_length=500, verbose_name='\u5546\u54c1\u63cf\u8ff0')),
                ('is_delete', models.BooleanField(default=False, verbose_name='\u903b\u8f91\u5220\u9664')),
            ],
            options={
                'verbose_name': '\u5546\u54c1\u4fe1\u606f',
                'verbose_name_plural': '\u5546\u54c1\u4fe1\u606f',
            },
        ),
        migrations.CreateModel(
            name='GoodsImage',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('image', models.ImageField(default='img/default_middile_2.png', upload_to='images/%Y_%m')),
                ('is_delete', models.BooleanField(default=False, verbose_name='\u903b\u8f91\u5220\u9664')),
                ('goods', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='goods.Goods', verbose_name='\u5546\u54c1')),
            ],
            options={
                'verbose_name': '\u5546\u54c1\u5b9e\u4f53\u56fe',
                'verbose_name_plural': '\u5546\u54c1\u5b9e\u4f53\u56fe',
            },
        ),
    ]
