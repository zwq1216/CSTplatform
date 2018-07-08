# -*- coding:utf-8 -*-
from __future__ import unicode_literals

from django.db import models
from datetime import datetime
from django.contrib.auth.models import AbstractUser

# Create your models here.


class UserProfile(AbstractUser):
    studentid = models.CharField(max_length=20, verbose_name=u"学号")
    grade = models.CharField(max_length=50, verbose_name=u"班级")
    # name = models.CharField(max_length=20, verbose_name=u"姓名")
    # password = models.CharField(max_length=50, verbose_name=u"密码")
    address = models.CharField(max_length=50, verbose_name=u"在校宿舍号")
    phone = models.CharField(max_length=11, verbose_name=u"手机号")
    # email = models.EmailField(max_length=50, verbose_name=u"邮箱号码")
    image = models.ImageField(upload_to="imagepersonal/%Y_%m", default="img/default_middile_2.png")
    altertime = models.DateTimeField(default=datetime.now, verbose_name=u"上次修改时间")
    activetime = models.DateTimeField(default=datetime.now, verbose_name=u"激活时间")

    class Meta:
        verbose_name = u"用户信息"
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return self.studentid


class UserActive(models.Model):
    studentid = models.CharField(max_length=20, verbose_name=u"学号")
    grade = models.CharField(max_length=50, verbose_name=u"班级")
    username = models.CharField(max_length=20, verbose_name=u"姓名")
    active = models.BooleanField(default=False, verbose_name=u"是否已经注册")
    add_time = models.DateTimeField(verbose_name=u"添加时间", default=datetime.now)

    class Meta:
        verbose_name = u"可注册学生信息"
        verbose_name_plural = verbose_name


class EmailVerifyRecord(models.Model):
    code = models.CharField(max_length=50, verbose_name=u"验证码")
    email = models.EmailField(max_length=50, verbose_name=u"邮箱号码")
    send_type = models.CharField(verbose_name=u"邮箱类型",
                                 choices=(("register", u"注册"), ("forget", u"忘记密码"), ("update_email", u"修改邮箱")),
                                 max_length=30)
    send_time = models.DateTimeField(verbose_name=u"发送时间", default=datetime.now)
    add_time = models.DateTimeField(verbose_name=u"添加时间", default=datetime.now)

    class Meta:
        verbose_name = u"邮箱验证"
        verbose_name_plural = verbose_name


class Banner(models.Model):
    title = models.CharField(max_length=100, verbose_name=u"标题")
    image = models.ImageField(upload_to="banner/%Y/%m", verbose_name=u"轮播图", max_length=100)
    url = models.URLField(max_length=200, verbose_name=u"访问地址")
    index = models.IntegerField(default=100, verbose_name=u"顺序")
    add_time = models.DateTimeField(default=datetime.now, verbose_name="添加时间")

    class Meta:
        verbose_name = u"轮播图"
        verbose_name_plural = verbose_name