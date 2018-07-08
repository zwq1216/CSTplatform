# -*- coding:utf-8 -*-
"""CSTplatform URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.9/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Add an import:  from blog import urls as blog_urls
    2. Import the include() function: from django.conf.urls import url, include
    3. Add a URL to urlpatterns:  url(r'^blog/', include(blog_urls))
"""
from django.conf.urls import url, include
from django.views.static import serve
from CSTplatform.settings import MEDIA_ROOT
from django.views.generic import TemplateView
# from django.contrib import admin

import xadmin

from users.views import LoginView, RegisterView, ActiveUserView, LogoutView
from goods.views import IndexView


urlpatterns = [
    url(r'^xadmin/', xadmin.site.urls),
    url(r'^$', IndexView.as_view(), name="index"),
    url(r'^register/$', RegisterView.as_view(), name="register"),
    url(r'^login/$', LoginView.as_view(), name="login"),
    url(r'^logout/$', LogoutView.as_view(), name="logout"),
    url(r'^active/(?P<active_code>.*)/$', ActiveUserView.as_view(), name="user_active"),

    # 用户相关url的配置
    url(r'^users/', include('users.urls', namespace="users")),

    # 商品相关url配置
    url(r'^goods/', include('goods.urls', namespace="goods")),

    # 用户操作相关url配置
    url(r'^operation/', include('operation.urls', namespace="operation")),

    # 上传文件的访问处理配置
    url('^media/(?P<path>.*)$', serve, {'document_root': MEDIA_ROOT}),

    # 验证码
    url(r'^captcha/', include('captcha.urls')),
]

# 全局404, 500页面配置
handler404 = 'users.views.page_not_found'
handler500 = 'users.views.page_error'

