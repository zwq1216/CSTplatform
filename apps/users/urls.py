# -*- coding:utf-8 -*-
from django.conf.urls import url

from .views import SendEmailView, ForgetpwdView, ResetView
from .views import PersonalView, UserFavView, GoodsFavView
from .views import UserInfoAlterView, UserInfoSaveView, AlterPasswordView


urlpatterns = [
    url(r'^sendemail/$', SendEmailView.as_view(), name="sendemail"),
    url(r'^resetpwd/(?P<active_code>.*)', ResetView.as_view(), name="resetpwd"),
    url(r'^forgetpwd/$', ForgetpwdView.as_view(), name="forgetpwd"),
    url(r'^personal/$', PersonalView.as_view(), name="personal"),
    url(r'^userfav/$', UserFavView.as_view(), name="userfav"),
    url(r'^goodsfav/$', GoodsFavView.as_view(), name="goodsfav"),
    url(r'^userinfoalter/(?P<id>\d+)$', UserInfoAlterView.as_view(), name="userinfoalter"),
    url(r'^userinfosave/$', UserInfoSaveView.as_view(), name="userinfosave"),
    url('^alterpassword/$', AlterPasswordView.as_view(), name="alterpassword"),
]

