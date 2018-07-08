# -*- coding:utf-8 -*-
from django.conf.urls import url

from .views import BooksListView, ToolsListView, EleProductsListView, OthersListView
from .views import BookDetailView, ToolDetailView, EleProductDetailView, OtherDetailView


urlpatterns = [
    # 列表页
    url(r'^books/list/$', BooksListView.as_view(), name="book_list"),
    url(r'^tools/list/$', ToolsListView.as_view(), name="tool_list"),
    url(r'^eleproducts/list/$', EleProductsListView.as_view(), name="eleproduct_list"),
    url(r'^others/list/$', OthersListView.as_view(), name="other_list"),

    # 商品详细页
    url(r'^books/detail/(?P<id>\d+)/$', BookDetailView.as_view(), name="book_detail"),
    url(r'^tools/detail/(?P<id>\d+)/$', ToolDetailView.as_view(), name="tool_detail"),
    url(r'^eleproducts/detail/(?P<id>\d+)/$', EleProductDetailView.as_view(), name="eleproduct_detail"),
    url(r'^others/detail/(?P<id>\d+)/$', OtherDetailView.as_view(), name="other_detail"),
]
