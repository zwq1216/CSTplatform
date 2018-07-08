# -*- coding:utf-8 -*-
from django import template

register = template.Library()


@register.filter("list")
def do_list(value):
    return range(1, value+1)