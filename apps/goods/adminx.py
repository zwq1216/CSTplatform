# -*- coding:utf-8 -*-

import xadmin
from .models import Goods, GoodsImage


class GoodImageInlines(object):
    model = GoodsImage
    extra = 0


class GoodsAdmin(object):
    list_display = ['user', 'goods_title', 'price', 'oprice', 'address', 'phone', 'description', 'category', 'is_delete', 'add_time']
    search_fields = ['user', 'goods_title', 'price', 'oprice', 'address', 'phone', 'description', 'category', 'is_delete']
    list_filter = ['user', 'goods_title', 'price', 'oprice', 'address', 'phone', 'description', 'category', 'is_delete', 'add_time']
    model_icon = "fa fa-circle-o"
    inlines = [GoodImageInlines]
    # relfield_style = 'fk-ajax'


class GoodsImageAdmin(object):
    list_display = ['goods', 'image', 'is_delete', 'add_time']
    search_fields = ['goods', 'image', 'is_delete']
    list_filter =['goods', 'image', 'is_delete', 'add_time']
    model_icon = "fa fa-file-image-o"


xadmin.site.register(Goods, GoodsAdmin)
xadmin.site.register(GoodsImage, GoodsImageAdmin)