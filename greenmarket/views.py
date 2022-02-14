import email
from itertools import product
from django import http
from django.http import HttpResponse, QueryDict
from django.shortcuts import render,redirect
from django.views import View
from django.http import HttpResponse
from django.contrib.auth import authenticate,logout,login
from django.contrib.auth.models import User
from django.contrib import messages

from greenmarket.models import *


# Create your views here.
class Home(View):
    def get(self,request):
        products=Product.objects.all()
        params={'products':products}
        return render(request,'home.html',params)



class Farmer_signup(View):
    def post(self,request):
        try:
            try:
                farmer_username=request.POST.get('farmer_username')
                farmer_password=request.POST.get('farmer_password')
                farmer_fname=request.POST.get('farmer_fname')
                farmer_lname=request.POST.get('farmer_lname')
                farmer_pno=request.POST.get('farmer_pno')
                farmer_city=request.POST.get('farmer_city')
                farmer_pincode=request.POST.get('farmer_pincode')
                farmer_email=request.POST.get('farmer_email')
            
            
            except:
                messages.error(request,'Requires all the feilds')
                return redirect('home')


            if(len(farmer_username)<5):
                messages.error(request,'Username length should be greater than five')
                return redirect('home')

            if(len(farmer_password)<5):
                messages.error(request,'Password length should be greater than five')
                return redirect('home')


            try:
                # MYSQL QUERIES TO GET FARMER DETAILS 
                farmer_query=Farmer.objects.raw('''SELECT * FROM FARMER''')
                for i in farmer_query:
                    if(i.pno==farmer_pno or i.email==farmer_email):
                        messages.error(request,'You already have account, Please Login')
                        return redirect('home')
            except:
                messages.error(request,'Something gone wrong!')
                return redirect('home')
            
            
            try:
                user_query=User.objects.raw('''SELECT * FROM auth_user''')
                for i in user_query:
                    if(i.username==farmer_username):
                        messages.error(request,'You already have account, Please Login')
                        return redirect('home')
            except Exception as e:
                messages.error(request,'Something gone wrong!')
                return redirect('home')


            try:
                newUser=User.objects.create_user(farmer_username,farmer_email,farmer_password)
                newUser.save()
                login(request,newUser)
                farmer_data=Farmer(username=farmer_username,lname=farmer_lname,fname=farmer_fname,pno=farmer_pno,city=farmer_city,pincode=farmer_pincode,email=farmer_email)
                farmer_data.save()
                messages.success(request,'Account created successfully')

            except Exception as e:
                messages.error(request,'Something gone wrong!')
            return redirect('home')

        except Exception as e:
            messages.error(request,'Something gone wrong!')
            return redirect('home')



class Farmer_login(View):
    def post(self,request):
        try:
            farmer_username=request.POST.get('farmer_username')
            farmer_password=request.POST.get('farmer_password')
            # accessing username of farmer
            user=authenticate(request,username=farmer_username,password=farmer_password)

            if user is None:
                messages.error(request, 'Invalid credentials, Please try again')
                return redirect('home')
            else:
                login(request,user)
                messages.success(request, 'Successfully Logged in')
                return redirect('home')

        except:
            messages.error(request, 'Something went wrong, Please try again')
            return redirect('home')



class Customer_signup(View):
    def post(self,request):
        try:
            try:
                customer_username=request.POST.get('customer_username')
                customer_password=request.POST.get('customer_password')
                customer_fname=request.POST.get('customer_fname')
                customer_lname=request.POST.get('customer_lname')
                customer_pno=request.POST.get('customer_pno')
                customer_city=request.POST.get('customer_city')
                customer_pincode=request.POST.get('customer_pincode')
                customer_email=request.POST.get('customer_email')
            
            
            except:
                messages.error(request,'Requires all the feilds')
                return redirect('home')


            if(len(customer_username)<5):
                messages.error(request,'Username length should be greater than five')
                return redirect('home')

            if(len(customer_password)<5):
                messages.error(request,'Password length should be greater than five')
                return redirect('home')


            try:
                # MYSQL QUERIES TO GET  CUSTOMER  DETAILS 
                customer_query=Customer.objects.raw('''SELECT * FROM CUSTOMER''')
                for i in customer_query:
                    if(i.pno==customer_pno or i.email==customer_email):
                        messages.error(request,'You already have account, Please Login')
                        return redirect('home')
            except:
                messages.error(request,'Something gone wrong!')
                return redirect('home')
            
            
            try:
                user_query=User.objects.raw('''SELECT * FROM auth_user''')
                for i in user_query:
                    if(i.username==customer_username):
                        messages.error(request,'You already have account, Please Login')
                        return redirect('home')
            except Exception as e:
                messages.error(request,'Something gone wrong!')
                return redirect('home')


            try:
                newUser=User.objects.create_user(customer_username,customer_email,customer_password)
                newUser.save()
                login(request,newUser)
                customer_data=Customer(username=customer_username,lname=customer_lname,fname=customer_fname,pno=customer_pno,city=customer_city,pincode=customer_pincode,email=customer_email)
                customer_data.save()
                messages.success(request,'Account created successfully')

            except Exception as e:
                messages.error(request,'Something gone wrong!')
            return redirect('home')

        except Exception as e:
            messages.error(request,'Something gone wrong!')
            return redirect('home')



class Customer_login(View):
    def post(self,request):
        try:
            customer_email=request.POST.get('customer_email')
            customer_password=request.POST.get('customer_password')
            try:
                f=Customer.objects.filter(email=customer_email)
                customer_username=f[0].username
                user=authenticate(request,username=customer_username,password=customer_password)
            except:
                messages.error(request, 'Invalid credentials, Please try again')
                return redirect('home')


            if user is None:
                messages.error(request, 'Invalid credentials, Please try again')
                return redirect('home')
            else:
                login(request,user)
                messages.success(request, 'Successfully Logged in')
                return redirect('home')

        except:
            messages.error(request, 'Something went wrong, Please try again')
            return redirect('home')



class Logout(View):
    def get(self,request):
        try:
            logout(request)
            messages.info(request, 'Successfully Logged out')
            return redirect('home')
        except:
            messages.error(request, 'Something went wrong, Please try again')
            return redirect('home')



class Product_details(View):
    def get(self,request,*args,**kwargs):
        sel_prod_id=kwargs.get('product_id')
        selling_list=SoldBy.objects.filter()
        for i in selling_list:
            print(i)
        return render(request,'product_details.html')