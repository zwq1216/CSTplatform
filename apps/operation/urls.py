# -*- coding:utf-8 -*-
from django.conf.urls import url

from .views import UserFavoriteView, PubInfoView, SearchView
from .views import GoodsDelView, GoodsFavDelView, UserFavDelView


urlpatterns = [
    url(r'^userfav/$', UserFavoriteView.as_view(), name="user_fav"),
    url(r'^pubinfo/$', PubInfoView.as_view(), name="pubinfo"),
    url(r'^search/(?P<name>.*)$', SearchView.as_view(), name="search"),
    url(r'^goods/del/(?P<id>\d+)$', GoodsDelView.as_view(), name="goods_del"),
    url(r'^fav/del/(?P<fav_id>\d+)$', GoodsFavDelView.as_view(), name="fav_del"),
    url(r'^userfav/del/(?P<fav_id>\d+)$', UserFavDelView.as_view(), name="userfav_del"),
]