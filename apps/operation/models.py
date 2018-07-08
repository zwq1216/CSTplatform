# -*- coding:utf-8 -*-
from __future__ import unicode_literals
from datetime import datetime
from django.db import models

from users.models import UserProfile
from goods.models import Goods
# Create your models here.


class UserFavorite(models.Model):
    user = models.ForeignKey(UserProfile, verbose_name=u"用户")
    fav_id = models.IntegerField(default=0, verbose_name=u"数据id")
    fav_type = models.IntegerField(choices=((1, u"用户"), (2, u"商品")), default=2, verbose_name="收藏类型")
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u"添加时间")

    class Meta:
        verbose_name = u"用户收藏"
        verbose_name_plural = verbose_name


class UserGoods(models.Model):
    user = models.ForeignKey(UserProfile, verbose_name=u"学生学号")
    goods =models.ForeignKey(Goods, verbose_name=u"商品标题")
    add_time = models.DateTimeField(default=datetime.now, verbose_name="添加时间")

    class Meta:
        verbose_name = u"用户商品"
        verbose_name_plural = verbose_name