# -*- coding:utf-8 -*-
from django import forms

from captcha.fields import CaptchaField

from .models import UserProfile, UserActive, Banner


class LoginForm(forms.Form):
    # studentid = forms.CharField(required=True)
    # password1 = forms.CharField(required=True, min_length=5)
    captcha = CaptchaField(error_messages={"invalid": u"验证码错误"})


class RegisterForm(forms.Form):
    # studentid = forms.CharField(required=True)
    # password1 = forms.CharField(required=True, min_length=5)
    # password2 = forms.CharField(required=True, min_length=5)
    # email = forms.EmailField(required=True)
    captcha = CaptchaField(error_messages={"invalid": u"验证码错误"})


class UserInfoSaveForm(forms.ModelForm):
    class Meta:
        model = UserProfile
        fields = ['address', 'phone', 'email']