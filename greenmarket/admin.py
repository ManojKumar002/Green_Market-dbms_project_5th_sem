from django.contrib import admin
from greenmarket.models import *
# Register your models here.

class Farmer_admin(admin.ModelAdmin):
    list_display=['username','fname','email']

class Product_admin(admin.ModelAdmin):
    list_display=['product_id','product_name']

class SoldBy_admin(admin.ModelAdmin):
    list_display=['product_id','farmer_id','price','quantity']

admin.site.register(Farmer,Farmer_admin)
admin.site.register(Product,Product_admin)
admin.site.register(SoldBy,SoldBy_admin)