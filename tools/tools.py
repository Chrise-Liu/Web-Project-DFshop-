# file: tools.py

def login_check(request):
    try:
        username = request.session['username']
        return 'login'
    except Exception :
        return ''

