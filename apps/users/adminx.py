# -*- coding:utf-8 -*-
from django.contrib import admin
import xadmin
from xadmin import views
from .models import UserProfile, EmailVerifyRecord, UserActive, Banner


class BaseSetting(object):
    enable_themes = True
    use_bootswatch = True


class GlobalSettings(object):
    site_title = "校园二手交易平台"
    site_footer = "校园二手交易平台"
    menu_style = "accordion"


class UserActiveAdmin(object):
    list_display = ['studentid', 'grade', 'username', 'active', 'add_time']
    search_fields = ['studentid', 'grade', 'username']
    list_filter = ['studentid', 'grade', 'username', 'active', 'add_time']
    model_icon = "fa fa-user"
    import_excel = True

    def post(self, request, *args, **kwargs):
        if 'excel' in request.FILES:
            import xlrd
            student = xlrd.open_workbook(filename=None, file_contents=request.FILES['excel'].read())
            sheet = student.sheet_by_index(0)
            nr = sheet.nrows
            print nr
            for row in xrange(1, nr):
                li = sheet.row_values(row)
                user_active =  UserActive()
                user_active.studentid = str(int(li[0]))
                user_active.username = li[1]
                user_active.grade = li[2]
                user_active.save()
        return super(UserActiveAdmin, self).post(request, args, kwargs)


class EmailVerifyRecordAdmin(object):
    list_display = ['code', 'email', 'send_type', 'send_time', 'add_time']
    search_fields = ['code', 'email', 'send_type', 'send_time']
    list_filter = ['code', 'email', 'send_type', 'send_time', 'add_time']
    model_icon = 'fa fa-envelope'  # 图标设置


class BannerAdmin(object):
    list_display = ['title', 'image', 'url', 'index', 'add_time']
    search_fields = ['title', 'image', 'url', 'index']
    list_filter = ['title', 'image', 'url', 'index', 'add_time']


xadmin.site.register(EmailVerifyRecord, EmailVerifyRecordAdmin)
xadmin.site.register(UserActive, UserActiveAdmin)
xadmin.site.register(Banner, BannerAdmin)
xadmin.site.register(views.BaseAdminView, BaseSetting)
xadmin.site.register(views.CommAdminView, GlobalSettings)