from django.contrib import admin

# Register your models here.

from .models import ProductModel,CartModel,OrderModel,OrderDetailModel

admin.site.register(ProductModel)
admin.site.register(CartModel)
admin.site.register(OrderModel)
admin.site.register(OrderDetailModel)