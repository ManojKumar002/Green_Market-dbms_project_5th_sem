from greenmarket.models import Customer,ConsumerCart,Farmer

def extras(request):
    current_username=request.user.username

    params={}
    #?cheks the type of the user
    if(Farmer.objects.raw("SELECT * FROM FARMER WHERE USERNAME=%s",[current_username])):
        user_type='F'
        params={'total_price':0,'user_type':user_type}

    elif(Customer.objects.raw("SELECT * FROM CUSTOMER WHERE USERNAME=%s",[current_username])):
        user_type='C'
        params={'user_type':user_type}
        sum=0
        cart_data=ConsumerCart.objects.filter(customer=Customer.objects.raw("SELECT * FROM CUSTOMER WHERE USERNAME=%s",[current_username])[0])
        for i in cart_data:
            sum+=i.quantity*i.price
        params={'cart_data':cart_data,'total_price':sum,'user_type':user_type}
        return params

    else:
        user_type='U'
        params={'total_price':0,'user_type':user_type}


    return params