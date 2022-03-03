from ast import Delete
from distutils.log import error
import email
from itertools import product
from logging import warning
from urllib import request
from django import http
from django.http import HttpResponse, QueryDict
from django.shortcuts import render,redirect
from django.views import View
from django.http import HttpResponse
from django.contrib.auth import authenticate,logout,login
from django.contrib.auth.models import User
from django.contrib import messages
from django.db import connection

from greenmarket.models import *


# Create your views here.
class Home(View):
    def get(self,request):
        params={}
        products=Product.objects.all()
        current_username=self.request.user.username
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
                return redirect('home')


            except Exception as e:
                messages.error(request,'Something gone wrong!')
            return redirect('home')

        except Exception as e:
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

        except Exception as e:
            print(e)
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
                return redirect('home')


            except Exception as e:
                messages.error(request,'Something gone wrong!')
            return redirect('home')

        except Exception as e:
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
        selling_list=SoldBy.objects.filter(product=Product.objects.get(product_id=sel_prod_id))
        params={'selling_list':selling_list}
        print(selling_list[0].product.product_name)
        return render(request,'product_details.html',params)


class Add_soldBy(View):
    def post(self,request):
        farmer_obj=Farmer.objects.filter(username=self.request.user)[0]

        if(request.POST.get('product_id')=="Select"):
            messages.error(request,"Please choose valid option")
            return redirect('home')

        if(int(request.POST.get('product_price'))<=0):
            messages.error(request,"Price should be greater than zero")
            return redirect('home')

        product_obj=Product.objects.filter(product_id=int(request.POST.get('product_id')))[0]
        product_quantity=int(request.POST.get('product_quantity'))
        product_price=int(request.POST.get('product_price'))

        if(int(product_quantity)<50):
            messages.error(request,"Product quantity should be atleast 50")
            return redirect('home')
        
        with connection.cursor() as cursor:
            cursor.execute(
                #!insert query to add tupples to the table SOLD_BY
                "INSERT INTO SOLD_BY(PRODUCT_ID,FARMER_ID,QUANTITY,PRICE)VALUES(%s,%s,%s,%s)",\
                    [product_obj.product_id,farmer_obj.farmer_id,product_quantity,product_price]
            )


        messages.success(request,"Product has been added successfully")
        return redirect('home')


class Add_to_cart(View):
    # here get method is used to delete the cart item
    def get(self,request):
        cart_product_id=request.GET.get('cart_product_id')

        with connection.cursor() as cursor:
            cursor.execute(
            #!delete query for cart item
            "DELETE FROM CONSUMER_CART WHERE ID=%s",[cart_product_id]
        )

        return redirect('home')

    #to add the product in the cart
    def post(self,request):
        quantity=request.POST.get('quantity')
        purchase_price=request.POST.get('purchase_price')
        product_id=request.POST.get('product_id')
        customer_name=request.POST.get('customer_name')
        farmer_id=request.POST.get('farmer_id')
        available_quantity=request.POST.get('available_quantity')
        print(available_quantity,quantity)

        if(int(available_quantity)<int(quantity)):
            messages.error(request,"Entered quantity should be less than the available quantity")
            return redirect('home')

    
        try:
            customer_object=Customer.objects.get(username=customer_name)
        except:
            messages.error(request,'Please create a customer account to make purchases')
            return redirect('home')

        farmer_object=Farmer.objects.get(farmer_id=farmer_id)
        product_object=Product.objects.get(product_id=product_id)
        cart=ConsumerCart(customer=customer_object,farmer=farmer_object,product=product_object,price=purchase_price,quantity=quantity)
        cart.save()
        return redirect('home')


class Purchase(View):

    def get(self,request):
        params={}

        current_username=self.request.user.username
        if(Farmer.objects.raw("SELECT * FROM FARMER WHERE USERNAME=%s",[current_username])):
            farmer_object=list(Farmer.objects.raw("SELECT * FROM FARMER WHERE USERNAME=%s",[current_username]))
            farmer_id=farmer_object[0].farmer_id
            purchase_data=list(Purchases.objects.raw("SELECT * FROM PURCHASES WHERE FARMER_ID=%s ORDER BY PURCHASE_TIMESTAMP DESC",[farmer_id]))


        elif(Customer.objects.raw("SELECT * FROM CUSTOMER WHERE USERNAME=%s",[current_username])):
            customer_object=list(Customer.objects.raw("SELECT * FROM CUSTOMER WHERE USERNAME=%s",[current_username]))
            customer_id=customer_object[0].customer_id
            purchase_data=list(Purchases.objects.raw("SELECT * FROM PURCHASES WHERE CUSTOMER_ID=%s ORDER BY PURCHASE_TIMESTAMP DESC",[customer_id]))
            print(purchase_data)

        else:
            messages.warning(request,"Login to make purchases")
            return redirect('home')


        params={'purchase_data':purchase_data}
        return render(request,'purchases.html',params)


    def post(self,request):
        current_username=self.request.user.username

        try:
            #!retreiving the current logged in consumer details 
            customer_object=list(Customer.objects.raw("SELECT * FROM CUSTOMER WHERE USERNAME=%s",[current_username]))
            customer_id=customer_object[0].customer_id
        except:
            messages.error(request,"Please create a customer account to make purchases ")
            return redirect('home')

        #!retreiving customer cart data
        cart_data=list(ConsumerCart.objects.raw("SELECT * FROM CONSUMER_CART WHERE CUSTOMER_ID=%s",[customer_id]))
        if(len(cart_data)==0):
            messages.warning(request,"Plaese add products to the cart first")
            return redirect('home')

        for i in cart_data:
            product_id=i.product.product_id
            farmer_id=i.farmer.farmer_id
            #!getting sold_by tables data to update
            sold_by_object=list(SoldBy.objects.raw("SELECT * FROM SOLD_BY WHERE PRODUCT_ID=%s AND FARMER_ID=%s",[product_id,farmer_id]))[0]
            
            if(sold_by_object.quantity> i.quantity):
                with connection.cursor() as cursor:
                    #!updating the sold_by table if ordered quntity is less than available quantity
                    cursor.execute(
                        "UPDATE SOLD_BY SET QUANTITY=%s WHERE ID=%s",[(sold_by_object.quantity- i.quantity),sold_by_object.id]   
                    )

            elif(sold_by_object.quantity == i.quantity):
                with connection.cursor() as cursor:
                    #!updating the sold_by table if ordered quntity is equal available quantity
                    cursor.execute(
                        "DELETE FROM SOLD_BY   WHERE ID=%s",[sold_by_object.id]
                    )

            with connection.cursor() as cursor:
                    #!creating the tupple in purchase
                    cursor.execute(
                        "INSERT INTO PURCHASES(PRODUCT_ID,FARMER_ID,CUSTOMER_ID,QUANTITY,PURCHASE_PRICE)VALUES(%s,%s,%s,%s,%s)",\
                            [i.product.product_id,i.farmer.farmer_id,i.customer.customer_id,i.quantity,i.price]
                    )

            with connection.cursor() as cursor:
                    #!updating the sold_by table if ordered quntity is equal available quantity
                    cursor.execute(
                        "DELETE FROM CONSUMER_CART WHERE ID=%s",[i.id]
                    )

        messages.success(request,"Order placed successfully")
        return redirect('home')
            
