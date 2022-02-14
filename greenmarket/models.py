# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class ChatCommunication(models.Model):
    id = models.AutoField(db_column='ID', primary_key=True)  # Field name made lowercase.
    customer = models.ForeignKey('Customer', models.DO_NOTHING, db_column='CUSTOMER_ID')  # Field name made lowercase.
    farmer = models.ForeignKey('Farmer', models.DO_NOTHING, db_column='FARMER_ID')  # Field name made lowercase.
    chat_timestamp = models.DateTimeField(db_column='CHAT_TIMESTAMP', blank=True, null=True)  # Field name made lowercase.
    message_json = models.CharField(db_column='MESSAGE_JSON', max_length=2000, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'CHAT_COMMUNICATION'


class ConsumerCart(models.Model):
    id = models.AutoField(db_column='ID', primary_key=True)  # Field name made lowercase.
    customer = models.ForeignKey('Customer', models.DO_NOTHING, db_column='CUSTOMER_ID')  # Field name made lowercase.
    product = models.ForeignKey('Product', models.DO_NOTHING, db_column='PRODUCT_ID')  # Field name made lowercase.
    farmer = models.ForeignKey('Farmer', models.DO_NOTHING, db_column='FARMER_ID')  # Field name made lowercase.
    price = models.IntegerField(db_column='PRICE')  # Field name made lowercase.
    quantity = models.IntegerField(db_column='QUANTITY')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'CONSUMER_CART'


class Customer(models.Model):
    customer_id = models.AutoField(db_column='CUSTOMER_ID', primary_key=True)  # Field name made lowercase.
    username = models.CharField(db_column='USERNAME', unique=True, max_length=20)  # Field name made lowercase.
    lname = models.CharField(db_column='LNAME', max_length=20)  # Field name made lowercase.
    pno = models.BigIntegerField(db_column='PNO', unique=True, blank=True, null=True)  # Field name made lowercase.
    city = models.CharField(db_column='CITY', max_length=20, blank=True, null=True)  # Field name made lowercase.
    pincode = models.IntegerField(db_column='PINCODE', blank=True, null=True)  # Field name made lowercase.
    email = models.CharField(db_column='EMAIL', unique=True, max_length=20)  # Field name made lowercase.
    fname = models.CharField(db_column='FNAME', max_length=20)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'CUSTOMER'
        unique_together = (('customer_id', 'username'),)


class Farmer(models.Model):
    farmer_id = models.AutoField(db_column='FARMER_ID', primary_key=True)  # Field name made lowercase.
    username = models.CharField(db_column='USERNAME', unique=True, max_length=20)  # Field name made lowercase.
    fname = models.CharField(db_column='FNAME', max_length=20)  # Field name made lowercase.
    lname = models.CharField(db_column='LNAME', max_length=20)  # Field name made lowercase.
    pno = models.BigIntegerField(db_column='PNO', unique=True, blank=True, null=True)  # Field name made lowercase.
    city = models.CharField(db_column='CITY', max_length=20, blank=True, null=True)  # Field name made lowercase.
    pincode = models.IntegerField(db_column='PINCODE', blank=True, null=True)  # Field name made lowercase.
    email = models.CharField(db_column='EMAIL', unique=True, max_length=20)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'FARMER'
        unique_together = (('farmer_id', 'username'),)


class Product(models.Model):
    product_id = models.AutoField(db_column='PRODUCT_ID', primary_key=True)  # Field name made lowercase.
    product_name = models.CharField(db_column='PRODUCT_NAME', max_length=20)  # Field name made lowercase.
    category = models.CharField(db_column='CATEGORY', max_length=20, blank=True, null=True)  # Field name made lowercase.
    product_desc = models.CharField(db_column='PRODUCT_DESC', max_length=200)  # Field name made lowercase.
    img = models.ImageField(db_column='IMG', upload_to="greenmarket/images", max_length=10000, blank=True, null=True)   # Field name made lowercase.

    class Meta:
        managed = True
        db_table = 'PRODUCT'


class Purchases(models.Model):
    id = models.AutoField(db_column='ID', primary_key=True)  # Field name made lowercase.
    product = models.ForeignKey(Product, models.DO_NOTHING, db_column='PRODUCT_ID')  # Field name made lowercase.
    customer = models.ForeignKey(Customer, models.DO_NOTHING, db_column='CUSTOMER_ID')  # Field name made lowercase.
    farmer = models.ForeignKey(Farmer, models.DO_NOTHING, db_column='FARMER_ID')  # Field name made lowercase.
    quantity = models.IntegerField(db_column='QUANTITY')  # Field name made lowercase.
    purchase_price = models.IntegerField(db_column='PURCHASE_PRICE')  # Field name made lowercase.
    purchase_timestamp = models.DateTimeField(db_column='PURCHASE_TIMESTAMP', blank=True, null=True)  # Field name made lowercase.
    delivery_date = models.DateField(db_column='DELIVERY_DATE', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'PURCHASES'


class SoldBy(models.Model):
    id = models.AutoField(db_column='ID', primary_key=True)  # Field name made lowercase.
    product = models.ForeignKey(Product, models.DO_NOTHING, db_column='PRODUCT_ID')  # Field name made lowercase.
    farmer = models.ForeignKey(Farmer, models.DO_NOTHING, db_column='FARMER_ID')  # Field name made lowercase.
    price = models.IntegerField(db_column='PRICE')  # Field name made lowercase.
    quantity = models.IntegerField(db_column='QUANTITY')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'SOLD_BY'


class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=150)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group', 'permission'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type', 'codename'),)


class AuthUser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.IntegerField()
    username = models.CharField(unique=True, max_length=150)
    first_name = models.CharField(max_length=150)
    last_name = models.CharField(max_length=150)
    email = models.CharField(max_length=254)
    is_staff = models.IntegerField()
    is_active = models.IntegerField()
    date_joined = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user', 'group'),)


class AuthUserUserPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        unique_together = (('user', 'permission'),)


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.PositiveSmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    id = models.BigAutoField(primary_key=True)
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'
