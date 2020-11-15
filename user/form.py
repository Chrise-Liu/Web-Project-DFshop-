# file: user/form.py

from django import forms

class UserForm(forms.Form):
    email = forms.EmailField(max_length=100)
    password = forms.CharField(max_length=32)
    username = forms.CharField(max_length=20)
    sex = forms.CharField(max_length=2)
    phone = forms.CharField(max_length=50)
    addr = forms.CharField(max_length=255)