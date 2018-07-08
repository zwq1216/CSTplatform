# -*- coding:utf-8 -*-
from django.shortcuts import render
from django.views.generic import View

from .models import Goods
from users.models import Banner
from operation.models import UserFavorite
# Create your views here.


class IndexView(View):
    def get(self, request):
        all_banners = Banner.objects.all().order_by('index')
        goods_books = Goods.objects.filter(category=1)[:10]
        goods_tools = Goods.objects.filter(category=2)[:10]
        goods_eleproducts = Goods.objects.filter(category=3)[:10]
        goods_others = Goods.objects.filter(category=4)[:10]
        return render(request, 'index.html', locals())


class BooksListView(View):
    def get(self, request):
        goods_books = Goods.objects.filter(category=1)
        return render(request, 'book_list.html', locals())


class ToolsListView(View):
    def get(self, request):
        goods_tools = Goods.objects.filter(category=2)
        return render(request, 'tool_list.html', locals())


class EleProductsListView(View):
    def get(self, request):
        goods_eleproducts = Goods.objects.filter(category=3)
        return render(request, 'eleproduct_list.html', locals())


class OthersListView(View):
    def get(self, request):
        goods_others = Goods.objects.filter(category=4)
        return render(request, 'other_list.html', locals())


class BookDetailView(View):
    def get(self, request, id):

        # 是否收藏商品
        has_fav_goods = False

        # 是否收藏卖主
        has_fav_user = False

        book_detail = Goods.objects.get(pk=id)
        user = book_detail.user
        all_images = book_detail.goodsimage_set.all()

        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user, fav_id=book_detail.id, fav_type=2):
                has_fav_goods = True
            if UserFavorite.objects.filter(user=request.user, fav_id=user.id, fav_type=1):
                has_fav_user = True

        return render(request, "book_detail.html", locals())


class ToolDetailView(View):
    def get(self, request, id):

        # 是否收藏商品
        has_fav_goods = False

        # 是否收藏卖主
        has_fav_user = False

        tool_detail = Goods.objects.get(pk=id)
        user = tool_detail.user
        all_images =tool_detail.goodsimage_set.all()

        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user, fav_id=tool_detail.id, fav_type=2):
                has_fav_goods = True
            if UserFavorite.objects.filter(user=request.user, fav_id=user.id, fav_type=1):
                has_fav_user = True

        return render(request, "tool_detail.html", locals())


class EleProductDetailView(View):
    def get(self, request, id):

        # 是否收藏商品
        has_fav_goods = False

        # 是否收藏卖主
        has_fav_user = False

        eleproduct_detail = Goods.objects.get(pk=id)
        user = eleproduct_detail.user
        all_images = eleproduct_detail.goodsimage_set.all()

        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user, fav_id=eleproduct_detail.id, fav_type=2):
                has_fav_goods = True
            if UserFavorite.objects.filter(user=request.user, fav_id=user.id, fav_type=1):
                has_fav_user = True

        return render(request, "eleproduct_detail.html", locals())


class OtherDetailView(View):
    def get(self, request, id):

        # 是否收藏商品
        has_fav_goods = False

        # 是否收藏卖主
        has_fav_user = False

        other_detail = Goods.objects.get(pk=id)
        user = other_detail.user
        all_images = other_detail.goodsimage_set.all()

        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user, fav_id=other_detail.id, fav_type=2):
                has_fav_goods = True
            if UserFavorite.objects.filter(user=request.user, fav_id=user.id, fav_type=1):
                has_fav_user = True

        return render(request, "other_detail.html", locals())
