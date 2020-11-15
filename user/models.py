from django.db import models

# Create your models here.

class UserModel(models.Model):
    email = models.EmailField(max_length=100, blank=True, default='')
    password = models.CharField(max_length=32, null=False)
    username = models.CharField(max_length=20, null=False)
    sex = models.CharField(max_length=2, null=False)
    phone = models.CharField(max_length=50, blank=True, default='')
    addr = models.CharField(max_length=255, blank=True, default='')

    def __str__(self):
        return self.username