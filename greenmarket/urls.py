from xml.etree.ElementInclude import include
from django.contrib import admin
from django.urls import path

from . import views

urlpatterns = [
    path('', views.Home.as_view(),name='home'),
    path('fsignup/', views.Farmer_signup.as_view(),name='farmer_signup'),
    path('flogin/', views.Farmer_login.as_view(),name='farmer_login'),
    path('csignup/', views.Customer_signup.as_view(),name='customer_signup'),
    path('clogin/', views.Customer_login.as_view(),name='customer_login'),
    path('logout/', views.Logout.as_view(),name='logout'),
    path('product_details/<int:product_id>', views.Product_details.as_view(),name='product_details'),
    path('add_soldBy/', views.Add_soldBy.as_view(),name='add_soldBy'),
]