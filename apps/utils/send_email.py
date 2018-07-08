# -*- coding:utf-8 -*-
from django.core.mail import send_mail
import base64
import uuid

from users.models import EmailVerifyRecord
from CSTplatform.settings import EMAIL_FROM


def send_register_email(email, send_type="register"):
    email_record = EmailVerifyRecord()
    code = base64.b64encode(uuid.uuid4().bytes)
    email_record.code = code
    email_record.email = email
    email_record.send_type = send_type
    email_record.save()

    if send_type == "register":
        email_title = "校园二手交易平台注册激活链接"
        email_body = "请点击下面的连接激活你的账号：http://127.0.0.1:8000/active/{0}".format(code)

        send_status = send_mail(email_title, email_body, EMAIL_FROM, [email])
        if send_status:
            pass
    elif send_type == "forget":
        email_title = "校园二手交易平台密码重置链接"
        email_body = "请点击下面的链接重置密码: http://127.0.0.1:8000/users/resetpwd/{0}".format(code)

        send_status = send_mail(email_title, email_body, EMAIL_FROM, [email])
        if send_status:
            pass