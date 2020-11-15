# file: product/urls.py

from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'^list/', views.products_list),
    url(r'^single/(\d+)', views.product_single),
    url(r'^cart/', views.cart),
    url(r'^delcart/(\w+)', views.del_one_cart),
    url(r'^delallcart/', views.delallcart),
    url(r'^cus_check/', views.cus_check),
    # url(r'^order_ok/', views.order_ok),
    url(r'^order_search', views.order_search),
    url(r'^qanda/', views.qanda),

    # url(r'^mail_test/', views.mail_test),
]