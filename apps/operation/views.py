# -*- coding:utf-8 -*-
from django.shortcuts import render
from django.http import HttpResponse, HttpResponseRedirect
from django.views.generic import View
from django.db.models import Q
from datetime import datetime
from django.core.urlresolvers import reverse
import json

from .models import UserFavorite
from goods.models import Goods, GoodsImage
from utils.loginrequired import LoginRequired
# Create your views here.


class UserFavoriteView(LoginRequired, View):
    def post(self, request):
        fav_id = request.POST.get("fav_id")
        fav_type = request.POST.get("fav_type")

        if request.user.is_authenticated():

            if UserFavorite.objects.filter(user=request.user, fav_id=fav_id, fav_type=fav_type):
                UserFavorite.objects.get(user=request.user, fav_id=fav_id, fav_type=fav_type).delete()
                return HttpResponse(json.dumps({"status": 0, "msg": "收藏"}))
            else:
                user_fav = UserFavorite()
                user_fav.user = request.user
                user_fav.fav_id = fav_id
                user_fav.fav_type = fav_type
                user_fav.save()
                return HttpResponse(json.dumps({"status": 0, "msg": "已收藏"}))
        else:
            return HttpResponse(json.dumps({"status": 1, "msg": "用户未登录，请先进行登录"}))


class PubInfoView(LoginRequired, View):
    def get(self, request):
        return render(request, "pubinfo.html")

    def post(self, request):
        goodsTitle = request.POST.get("goodsTitle")
        price = request.POST.get("price")
        oprice = request.POST.get("oprice")
        category = int(request.POST.get("category"))
        address = request.POST.get("address")
        phone = request.POST.get("phone")
        description = request.POST.get("description")
        img1 = request.FILES.get("img1")
        img2 = request.FILES.get("img2")
        img3 = request.FILES.get("img3")
        img4 = request.FILES.get("img4")
        print category
        images = []
        for img in [img1, img2, img3, img4]:
            if img is not None:
                images.append(img)

        if goodsTitle and price and address and phone and description and len(images) > 0:
            goods = Goods.objects.create(user=request.user, goods_title=goodsTitle, price=price,
                                        oprice=oprice, address=address, phone=phone,
                                        description=description, add_time=datetime.now(), category=category)
            goods.save()
        else:
            return render(request, "pubsuccess.html", {"status": 0, "msg": "发布失败！请按要求填写完整基本信息"})

        for img in images:
            goodsImg = GoodsImage()
            goodsImg.goods = goods
            goodsImg.image = img
            goodsImg.add_time = datetime.now()
            goodsImg.save()

        return render(request, "pubsuccess.html", {"status": 1, "msg": "发布成功！"})


class SearchView(View):
    def get(self, request, name):
        search_list = Goods.objects.filter(Q(goods_title__icontains=name) | Q(description__icontains=name))

        return render(request, "search_list.html", locals())


class GoodsDelView(LoginRequired, View):
    def get(self, request, id):
        Goods.objects.get(pk=id).delete()
        UserFavorite.objects.filter(fav_id=id).delete()

        return HttpResponseRedirect(reverse("users:personal"))


class GoodsFavDelView(LoginRequired, View):
    def get(self, request, fav_id):
        UserFavorite.objects.get(user=request.user, fav_id=fav_id, fav_type=2).delete()

        return HttpResponseRedirect(reverse("users:goodsfav"))


class UserFavDelView(LoginRequired, View):
    def get(self, request, fav_id):
        UserFavorite.objects.get(user=request.user, fav_id=fav_id, fav_type=1).delete()

        return HttpResponseRedirect(reverse("users:userfav"))