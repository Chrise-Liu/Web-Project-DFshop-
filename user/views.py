from django.shortcuts import render
from user.form import UserForm
import hashlib
from user.models import UserModel
from django.http import HttpResponseRedirect

# Create your views here.

def login(request):
    if request.method == 'GET':
        return render(request,'login.html')

    elif request.method == "POST":
        # 驗證email ＆ 密碼 正確--> 設置session 給status
        email = request.POST.get('email','')
        password = request.POST.get('password','')

        # 獲取用戶資料
        try:
            user = UserModel.objects.get(email=email)
        except Exception as e:
            # 如果出錯，表示該用戶尚未註冊
            msg = '該信箱尚未註冊'
            return render(request,'login.html',locals())

        # 獲取到用戶資料 核對密碼
        m = hashlib.md5()
        m.update(password.encode())
        password = m.hexdigest()

        if str(password) == str(user.password):
            # 說明登入成功 設置session 給status
            request.session['username'] = user.username
            request.session.set_expiry(24*60*60) # 設置session一天
            username = request.session['username']
            status = 'login'
            return HttpResponseRedirect('/') # 直接跳轉到'/'首頁，若用render'index.html'會出錯。
        else:
            msg = '信箱或密碼錯誤，請重新嘗試。'
            return render(request,'login.html',locals())



def logout(request):
    if 'username' in request.session:
        del request.session['username']
    # 直接跳轉到'/'首頁，若用render'index.html'會出錯。
    return HttpResponseRedirect('/')

def registration(request):
    if request.method == "GET":
        # 創建空的驗證表單，並返回頁面
        userform = UserForm()
        return render(request,'registration.html',locals())

    elif request.method == "POST":
        userform = UserForm(request.POST) #建立forms物件
        if userform.is_valid(): # 若通過form驗證
            # 開始獲取數據
            username = userform.cleaned_data['username']
            password = userform.cleaned_data['password']
            password1 = request.POST.get('password1')
            email = userform.cleaned_data['email']
            sex = userform.cleaned_data['sex']
            phone = userform.cleaned_data['phone']
            addr = userform.cleaned_data['addr']

            # 驗證密碼
            if password != password1:
                msg = '帳號或密碼輸入有誤。'
                return render(request,'registration.html',locals())

            # 兩次密碼一致，進行密碼處理 md5 哈希/散列
            m = hashlib.md5()
            m.update(password1.encode())
            password = m.hexdigest()

            # 驗證是否已經註冊過
            try:
                UserModel.objects.get(email=email)
                msg = '此信箱已經註冊過。'
                return render(request, 'registration.html', locals())
            except Exception as e:
                pass
            # 通過驗證就創建數據
            user = UserModel.objects.create(email=email,
                                            password=password,
                                            username=username,
                                            sex=sex,
                                            phone=phone,
                                            addr=addr)
            user.save()
            return render(request,'login.html',locals())