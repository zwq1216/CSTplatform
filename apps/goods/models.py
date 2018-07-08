# -*- coding:utf-8 -*-
from __future__ import unicode_literals

from django.db import models
from datetime import datetime
from users.models import UserProfile
# Create your models here.


class Goods(models.Model):
    user = models.ForeignKey(UserProfile, verbose_name=u"发布者学号", default=u"")
    goods_title = models.CharField(max_length=50, verbose_name=u"标题")
    price = models.CharField(max_length=20, verbose_name=u"价格")
    oprice = models.CharField(max_length=20, verbose_name=u"原价")
    address = models.CharField(max_length=50, verbose_name=u"地址")
    phone = models.CharField(max_length=11, verbose_name=u"手机号")
    description = models.CharField(max_length=500, verbose_name=u"商品描述")
    category = models.IntegerField(verbose_name=u"商品分类", choices=((1, u"书籍类"), (2, u"机动类"), (3, u"电子产品"), (4, u"其他")), default=1)
    is_delete = models.BooleanField(default=False, verbose_name=u"逻辑删除")
    add_time = models.DateTimeField(verbose_name=u"添加时间", default=datetime.now)

    class Meta:
        verbose_name = u"商品信息"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.goods_title


class GoodsImage(models.Model):
    goods = models.ForeignKey(Goods, verbose_name=u"商品", null=True, blank=True, on_delete=models.SET_NULL)
    image = models.ImageField(upload_to="images/%Y_%m", default="img/default_middile_2.png", verbose_name=u"商品实体图片", max_length=100)
    is_delete = models.BooleanField(default=False, verbose_name=u"逻辑删除")
    add_time = models.DateTimeField(verbose_name=u"添加时间", default=datetime.now)

    class Meta:
        verbose_name = u"商品实体图"
        verbose_name_plural = verbose_name