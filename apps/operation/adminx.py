# -*- coding:utf-8 -*-
import xadmin
from .models import UserFavorite, UserGoods


class UserFavoriteAdmin(object):
    list_display = ['user', 'fav_id', 'fav_type', 'add_time']
    search_fields = ['user', 'fav_id', 'fav_type']
    list_filter = ['user', 'fav_id', 'fav_type', 'add_time']
    model_icon = "fa fa-star-o"


class UserGoodsAdmin(object):
    list_display = ['user', 'goods', 'add_time']
    search_fields = ['user', 'goods']
    list_filter = ['user', 'goods', 'add_time']
    model_icon ="fa fa-circle"


xadmin.site.register(UserFavorite, UserFavoriteAdmin)
xadmin.site.register(UserGoods, UserGoodsAdmin)