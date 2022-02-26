from greenmarket.models import Customer,ConsumerCart

def extras(request):
    current_username=request.user.username
    if(Customer.objects.raw("SELECT * FROM CUSTOMER WHERE USERNAME=%s",[current_username])):
        sum=0
        cart_data=ConsumerCart.objects.filter(customer=Customer.objects.raw("SELECT * FROM CUSTOMER WHERE USERNAME=%s",[current_username])[0])
        for i in cart_data:
            sum+=i.quantity*i.price
        return {'cart_data':cart_data,'total_price':sum}
    return {'total_price':0}