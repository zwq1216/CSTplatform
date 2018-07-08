# -*- coding:utf-8 -*-
from django.shortcuts import render
from django.http import HttpResponseRedirect, HttpResponse
from django.contrib.auth import authenticate, login, logout
from django.views.generic import View
from django.core.urlresolvers import reverse
from django.contrib.auth.backends import ModelBackend
from django.contrib.auth.hashers import make_password
from django.db.models import Q
import json
import re


from .models import UserProfile, UserActive, EmailVerifyRecord
from .forms import LoginForm, RegisterForm, UserInfoSaveForm
from utils.send_email import send_register_email
from goods.models import Goods
from operation.models import UserFavorite
from utils.loginrequired import LoginRequired
# Create your views here.


class CustomBackend(ModelBackend):
    def authenticate(self, username=None, password=None, **kwargs):
        try:
            user = UserProfile.objects.get(Q(studentid=username) | Q(username=username))
            if user.check_password(password):
                return user
        except Exception as e:
            return None


class LoginView(View):
    def get(self, request):
        login_form = LoginForm()
        return render(request, 'login.html', {"login_form": login_form})

    def post(self, request):
        login_form = LoginForm(request.POST)
        if login_form.is_valid():
            student_id = request.POST.get("studentid", "")
            pass_word = request.POST.get("password1", "")
            user = authenticate(username=student_id, password=pass_word)
            if user is not None:
                if user.is_active:
                    login(request, user)
                    return HttpResponse(json.dumps({"status": 1, "msg": "登录成功"}))
                else:
                    return HttpResponse(json.dumps({"status": 0, "msg": "用户未激活"}))
            else:
                return HttpResponse(json.dumps({"status": 0, "msg": "学号或密码错误"}))
        else:
            return HttpResponse(json.dumps({"status": 0, "msg": "验证码错误"}))


class RegisterView(View):
    def get(self, request):
        register_form = RegisterForm()
        return render(request, 'register.html', {"register_form": register_form})

    def post(self, request):
        register_form = RegisterForm(request.POST)
        pwd1 = request.POST.get("password1")
        pwd2 = request.POST.get("password2")
        email = request.POST.get("email")
        student_id = request.POST.get("studentid")

        if register_form.is_valid():
            if pwd1 == pwd2:
                try:
                    student = UserActive.objects.get(studentid=student_id)
                    if not student.active:
                        pattern = re.compile(r'^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$')
                        if pattern.match(email):
                            user = UserProfile()
                            user.studentid = student_id
                            user.grade = student.grade
                            user.username = student.username
                            student.active = True
                            user.email = email
                            user.is_active = False
                            user.password = make_password(pwd1)
                            user.save()
                            student.save()
                            send_register_email(email, "register")
                            return HttpResponse(json.dumps({"status": 1, "msg": "注册成功,请根据邮箱发送的地址进行激活"}))
                        else:
                            return HttpResponse(json.dumps({"status": 0, "msg": "请输入正确的邮箱地址"}))
                    else:
                        return HttpResponse(json.dumps({"status": 0, "msg": "该用户已经注册"}))
                except Exception as e:
                    return HttpResponse(json.dumps({"status": 0, "msg": "该用户不存在，请联系管理员"}))
            else:
                return HttpResponse(json.dumps({"status": 0, "msg": "密码不一致"}))
        else:
            return HttpResponse(json.dumps({"status": 0, "msg": "验证码错误"}))


class ActiveUserView(View):
    def get(self, request, active_code):
        login_form = LoginForm()
        all_records = EmailVerifyRecord.objects.filter(code=active_code)
        if all_records:
            for record in all_records:
                email = record.email
                user = UserProfile.objects.get(email=email)
                user.is_active = True
                user.save()
        else:
            return render(request, "active_fail.html")

        return render(request, 'login.html', {"login_form": login_form})


class SendEmailView(View):
    def get(self, request):
        return render(request, "send_email.html")

    def post(self, request):
        email = request.POST.get("email")
        send_register_email(email, "forget")
        return render(request, "send_success.html")


class ResetView(View):
    def get(self, request, active_code):
        all_records = EmailVerifyRecord.objects.filter(code=active_code)
        if all_records:
            return render(request, "forgetpwd.html")
        else:
            return render(request, "active_fail.html")


class ForgetpwdView(View):
    def post(self, request):
        student_id = request.POST.get("studentid")
        pwd1 = request.POST.get("password1")
        pwd2 = request.POST.get("password2")
        email = request.POST.get("email")
        users = UserProfile.objects.filter(studentid=student_id)
        if pwd1 == pwd2:
            if users:
                for user in users:
                    if user.email == email:
                        user.password = make_password(pwd1)
                        user.save()
                        return HttpResponse(json.dumps({"status": 1, "msg": "修改成功"}))
                    else:
                        return HttpResponse(json.dumps({"status": 0, "msg": "请正确输入备注的邮箱号码"}))
            else:
                return HttpResponse(json.dumps({"status": 0, "msg": "用户不存在"}))
        else:
            return HttpResponse(json.dumps({"status": 0, "msg": "密码不一致"}))


class LogoutView(View):
    """
    用户登出
    """
    def get(self, request):
        logout(request)
        return HttpResponseRedirect(reverse("index"))


class PersonalView(LoginRequired, View):
    def get(self, request):
        pub_list = Goods.objects.filter(user=request.user)
        return render(request, "personal.html", {"pub_list": pub_list})


class UserFavView(LoginRequired, View):
    def get(self, request):
        fav_list = UserFavorite.objects.filter(user=request.user, fav_type=1)
        if fav_list:
            user_list = []
            for fav in fav_list:
                try:
                    fav_info = UserProfile.objects.get(pk=fav.fav_id)
                    user_list.append(fav_info)
                except Exception as e:
                    fav.delete()
            return render(request, "userfav.html", locals())

        return render(request, "userfav.html", locals())


class GoodsFavView(LoginRequired, View):
    def get(self, request):
        fav_list = UserFavorite.objects.filter(user=request.user, fav_type=2)
        if fav_list:
            goods_list = []
            for fav in fav_list:
                fav_info = Goods.objects.get(pk=fav.fav_id)
                goods_list.append(fav_info)

            return render(request, "goodsfav.html", locals())

        return render(request, "goodsfav.html", locals())


class UserInfoAlterView(LoginRequired, View):
    def get(self, request, id):
        user = UserProfile.objects.get(pk=id)

        return render(request, "userinfoAlter.html", locals())


class UserInfoSaveView(LoginRequired, View):
    def post(self, request):
        user_alter_form = UserInfoSaveForm(request.POST, instance=request.user)
        if user_alter_form.is_valid():
            user_alter_form.save()
            return HttpResponseRedirect(reverse("users:personal"))


class AlterPasswordView(LoginRequired, View):
    def get(self, request):
        return render(request, "password_alter.html")

    def post(self, request):
        password1 = request.POST.get("password1")
        password2 = request.POST.get("password2")
        if password1 == password2:
            request.user.password = make_password(password1)
            request.user.save()
            logout(request)

        return HttpResponseRedirect(reverse("index"))


def page_not_found(request):
    # 全局404处理函数
    from django.shortcuts import render_to_response
    response = render_to_response('404.html', {})
    response.status_code = 404
    return response


def page_error(request):
    # 全局500处理函数
    from django.shortcuts import render_to_response
    response = render_to_response('500.html', {})
    response.status_code = 500
    return response