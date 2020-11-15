from django.shortcuts import render,HttpResponseRedirect,HttpResponse
from product.models import ProductModel,CartModel,OrderModel,OrderDetailModel
from user.models import UserModel
from tools.tools import login_check
from django.core.mail import EmailMessage
from django.conf import settings
from django.template.loader import render_to_string

# Create your views here.

orderid = 1091100001

def products_list(request):
    """
    商品列表頁面方法：
        獲取全部商品訊息
    """
    if request.method == 'GET':
        status = login_check(request) # 確認登入狀況
        if status:
            username = request.session['username']
            # 確認用戶購物車中商品數量
            usercart = CartModel.objects.filter(username=request.session['username'])
            item_num = int(len(usercart))

        products = ProductModel.objects.all()

        return render(request,'products.html',locals())

def product_single(request,id):
    """
    商品詳細頁面方法：
        GET 表示獲取單一商品詳細內容
        POST 表示添加該雙品至購物車
    """
    if request.method == 'GET':
        status = login_check(request) # 確認登入狀況
        if status:
            username = request.session['username']
            # 確認用戶購物車中商品數量
            usercart = CartModel.objects.filter(username=request.session['username'])
            item_num = int(len(usercart))

        try:
            product = ProductModel.objects.get(id=id)
        except:
            product = 'error'

        return render(request,'one_product.html',locals())

    elif request.method == 'POST':
        # 獲取用戶選購資料
        pid = id
        try:
            unit = ProductModel.objects.get(id=pid)
        except Exception as e:
            msg = '商品出現錯誤請重新嘗試。'
            return render(request,'one_product.html',locals())

        pname = unit.pname
        username = request.session['username']
        amount = int(request.POST.get('num',''))
        price = int(unit.pprice)
        total = int(amount) * int(price)

        # 若cart中沒有該項商品 -創建一筆新的cart紀錄
        try:
            acart = CartModel.objects.get(productid=pid)
            # 表示已經有該商品項目
            acart.amount += amount
            acart.total = acart.amount * acart.price
            acart.save()
        except Exception as e:
            # 表示沒有該商品項目
            acart = CartModel.objects.create(productid=pid,
                                             pname=pname,
                                             username=username,
                                             amount=amount,
                                             price=price,
                                             total=total)
            acart.save()

        # 確認用戶購物車中商品數量
        usercart = CartModel.objects.filter(username=request.session['username'])
        item_num = int(len(usercart))

        return HttpResponseRedirect('/product/list')


def cart(request):
    """
    購物車頁面：
        GET 表示獲取用戶的購物車內容
        POST 表示修改購物車內容
    """
    if request.method == 'GET':
        status = login_check(request)  # 確認登入狀況
        if status:
            username = request.session['username']
            # 返回對象-->計算總額
            cartlist = CartModel.objects.filter(username=username)
            # 給alltotal all 兩個變數
            alltotal = 0
            for i in cartlist:
                alltotal += i.total
            all = alltotal + 100
        else:
            return HttpResponseRedirect('/user/login')
        return render(request, 'cart.html', locals())

    elif request.method == 'POST':
        """
        接收POST請求的數據，逐條對cart表進行修改，在load回去
        """
        username = request.session['username']
        for i in range(1,10):
            if "pname{}".format(i) in request.POST:
                pname = request.POST.get("pname{}".format(i),'')
                upamount = request.POST.get('update_amount{}'.format(i),'')

                # 在cart找到要更新的商品 更新數量及總價
                try:
                    unit = CartModel.objects.get(username=username,pname=pname)
                except:
                    return HttpResponse('error')
                unit.amount = int(upamount)
                unit.total = unit.amount * unit.price
                unit.save()
            else:
                continue
        return HttpResponseRedirect('/product/cart')


def del_one_cart(request,pname):
    """
    刪除單一項商品
    """
    username = request.session['username']
    pname = pname
    try:
        items = CartModel.objects.get(username=username, pname=pname)
        print(items)
        items.delete()
    except:
        return HttpResponse('error')

    return HttpResponseRedirect('/product/cart')


def delallcart(request):
    """
    刪除該用戶全部購物車商品
    """
    # username = request.session['username']
    # cartlist = CartModel.objects.filter(username=username)
    # cartlist.delete()
    remove_cart(request)

    return HttpResponseRedirect('/product/cart')


def cus_check(request):
    """
    訂單與用戶資訊確認方法：
        GET 表示確認用戶資訊
        POST 表示生成訂單
    """
    if request.method == 'GET':
        status = login_check(request)  # 確認登入狀況
        if status:
            username = request.session['username']

        try:
            user = UserModel.objects.get(username=username)
        except Exception:
            user = 'error'
            return HttpResponseRedirect('/user/login')

        # 返回對象-->計算總額
        cartlist = CartModel.objects.filter(username=username)
        if not cartlist:
            return HttpResponseRedirect("/product/list")
        # 給alltotal all 兩個變數
        alltotal = 0
        for i in cartlist:
            alltotal += i.total
        all = alltotal + 100

        return render(request, 'cus_check.html',locals())

    elif request.method == 'POST':
        # 獲得創建訂單所需資訊
        username = request.session['username']
        status = 'login'
        # try:
        #     userid = UserModel.objects.get(username=username)
        # except Exception as e:
        #     msg = 'user error'
        #     return HttpResponse(msg)

        userphone = request.POST.get('phone','')
        useraddr = request.POST.get('addr','')
        useremail = request.POST.get('email','')
        # 獲取訂單編號
        orderid = generate_orderid()

        # - 獲取購物車內容  作為字典
        # """
        # 字典內容：
        #     {
        #     '商品1名稱':{
        #         '商品單價':pprice,
        #         '商品數量':amount,
        #         '商品總價':total
        #         }
        #     '商品2名稱':{
        #         '商品單價':pprice,
        #         '商品數量':amount,
        #         '商品總價':total
        #         }
        #     }
        # """
        # 獲取購物車內的選購商品
        cartlist = CartModel.objects.filter(username=username)
        if not cartlist:
            return HttpResponseRedirect("/product/list")

        # 創建詳細訂單 及 紀錄總額
        alltotal = 0
        for i in cartlist:
            OrderDetailModel.objects.create(orderid=orderid,
                                            pname=i.pname,
                                            price=i.price,
                                            amount=i.amount,
                                            total=i.total)
            alltotal += i.total

        # 將username改為收件人名稱
        username = request.POST.get('username','')

        # 創建訂單
        OrderModel.objects.create(orderid=orderid,
                                  alltotal=alltotal,
                                  username=username,
                                  userphone=userphone,
                                  useraddr=useraddr,
                                  useremail=useremail)

        # 移除購物車內容
        remove_cart(request)

        # 寄出確認信
        # mail模板
        email_template = render_to_string('mail.html',{'username':username,'orderid':orderid})
        email = EmailMessage(
            '訂單完成通知信', # mail標題
            email_template, # mail內容
            settings.EMAIL_HOST_USER, # 寄件者
            [useremail] # 收件者
        )
        email.fail_silently = False
        email.send() # 寄出郵件

        return render(request,'order_ok.html',locals())


def order_search(request):
    """
    訂單查詢頁面：
        GET 表示獲取訂單查詢表單
        POST 表示獲取訂單編號 查詢訂單細項
    """
    if request.method == 'GET':
        status = login_check(request)  # 確認登入狀況
        if status:
            username = request.session['username']

        try:
            user = UserModel.objects.get(username=username)
        except Exception:
            user = 'error'
            return HttpResponseRedirect('/user/login')

        return render(request,'order_search.html',locals())

    elif request.method == 'POST':
        username = request.session['username']
        status = 'login'

        # 獲取orderid email 並檢驗訂單編號及email是否有誤
        orderid = int(request.POST.get('orderid',''))
        email = request.POST.get('email','')
        # 獲取訂單資料
        try:
            unit = OrderModel.objects.get(orderid=orderid)
        except Exception as e:
            msg = '訂單編號或信箱有誤，請重新嘗試。'
            return render(request,'order_search.html',locals())

        # 獲取訂單內容，返回order_info頁面
        # 獲取訂單中用戶資訊
        try:
            item = OrderModel.objects.get(orderid=orderid,useremail=email)
        except Exception as e:
            msg = "查無相關訂單訊息，請重新嘗試。"
            return render(request,'order_search.html',locals())

        recname = item.username
        phone = item.userphone
        addr = item.useraddr
        email = item.useremail
        create_time = item.create_time
        alltotal = item.alltotal
        all = alltotal + 100

        # 獲取訂單中商品資訊 orderlist
        orderlist = OrderDetailModel.objects.filter(orderid=orderid)

        return render(request,'order_info.html',locals())


def qanda(request):
    if request.method == 'GET':
        status = login_check(request)  # 確認登入狀況
        if status:
            username = request.session['username']

    return render(request,'qanda.html',locals())



def remove_cart(request):
    """
    移除用戶購物車方法
    :param request: 用戶request對象
    """
    username = request.session['username']
    cartlist = CartModel.objects.filter(username=username)
    cartlist.delete()

def generate_orderid():
    """
    生成orderid 的方法
    :return: 沒有重複的orderid
    """
    global orderid
    orders = OrderModel.objects.all()
    while True:
        for i in orders:
            if i.orderid == str(orderid):
                orderid += 1
        else:
            break
    return orderid

# def mail_test(request):
#     # mail模板
#     email_template = render_to_string('mail.html')
#     email = EmailMessage(
#         '訂單完成通知信',  # mail標題
#         email_template,  # mail內容
#         settings.EMAIL_HOST_USER,  # 寄件者
#         ['zmlpqawsa@gmail.com']  # 收件者
#     )
#     email.fail_silently = False
#     email.send()  # 寄出郵件
#
#     return HttpResponse('寄送mail中')