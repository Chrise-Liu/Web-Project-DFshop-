from django.db import models

# Create your models here.

class ProductModel(models.Model):
    pname = models.CharField('商品名稱',max_length=100, default='')
    pprice = models.IntegerField('商品價格',default=0)
    pimage = models.CharField('商品照片',max_length=100, default='')
    pdescription = models.TextField('商品描述',blank=True, default='')

    def __str__(self):
        return self.pname


class CartModel(models.Model):
    productid = models.CharField('商品id', max_length=16, null=False)
    pname = models.CharField('商品名稱',max_length=100, null=False ,default='')
    username = models.CharField('用戶名稱', max_length=32, null=False)
    amount = models.IntegerField('商品數量', default=1)
    price = models.IntegerField('商品單價', default=0)
    total = models.IntegerField('商品總價', default=0)

    def __str__(self):
        return self.username


class OrderModel(models.Model):
    orderid = models.CharField('訂單編號', max_length=16, null=False)
    alltotal = models.IntegerField('訂單總價', default=0)
    username = models.CharField('用戶名稱', max_length=32, null=False,default='')
    userphone = models.CharField('用戶手機',max_length=50, blank=True, default='')
    useraddr = models.CharField('用戶地址',max_length=255, blank=True, default='')
    useremail = models.EmailField('用戶信箱',max_length=100, blank=True, default='')
    create_time = models.DateTimeField('訂單成立時間',auto_now_add=True)

    def __str__(self):
        return self.orderid

class OrderDetailModel(models.Model):
    orderid = models.CharField('訂單編號', max_length=16, null=False)
    pname = models.CharField('商品名稱',max_length=100, null=False ,default='')
    price = models.IntegerField('商品單價', default=0)
    amount = models.IntegerField('商品數量', default=1)
    total = models.IntegerField('商品總價', default=0)

    def __str__(self):
        return self.orderid