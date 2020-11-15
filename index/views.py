from django.shortcuts import render
from tools.tools import login_check

# Create your views here.

def index(request):
    # if request.method == 'GET':
    #     if 'username' in request.session:
    #         username = request.session['username']
    #         status = 'login'
    #         return render(request,'index.html',locals())
    #     else:
    #         status = ''
    #         return render(request, 'index.html', locals())
    if request.method == 'GET':
        status = login_check(request) # 確認登入狀況
        if status:
            username = request.session['username'] # 返回username
            return render(request, 'index.html', locals())
        else:
            return render(request, 'index.html', locals())


