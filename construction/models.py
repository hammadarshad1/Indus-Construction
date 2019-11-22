from django.db import models
from django.contrib.auth.models import User
import datetime



# Create your models here.
class Category(models.Model):
    categoryId = models.AutoField(primary_key = True)
    categoryName = models.CharField(max_length = 100, unique = True)
    userId = models.ForeignKey(User,models.SET_NULL, blank = True, null = True)

    def __str__(self):
        return self.categoryName

class ChartOfAccount(models.Model):
    account_id = models.CharField(max_length = 100)
    account_title = models.CharField(max_length = 100, unique = True)
    parent_id = models.IntegerField()
    opening_balance = models.DecimalField(max_digits = 20, decimal_places = 2)
    phone_no = models.CharField(max_length = 100)
    email_address = models.CharField(max_length = 100)
    ntn = models.CharField(max_length = 100)
    stn = models.CharField(max_length = 100)
    cnic = models.CharField(max_length = 100)
    Address = models.CharField(max_length = 200)
    remarks = models.CharField(max_length = 100)
    credit_limit = models.DecimalField(max_digits = 20, decimal_places = 2)
    user_id = models.ForeignKey(User,models.SET_NULL, blank = True, null = True)


    def __str__(self):
        return self.account_title

class Project(models.Model):
    projectId = models.AutoField(primary_key = True)
    projectName = models.CharField(max_length = 100)
    amount = models.DecimalField(max_digits = 20, decimal_places = 2)
    accountId = models.ForeignKey(ChartOfAccount, on_delete = models.CASCADE)
    userId = models.ForeignKey(User,models.SET_NULL, blank = True, null = True)
    narration = models.TextField()
    projectDate = models.DateField(default = datetime.date.today)
    payMethod = models.CharField(max_length = 10)

    def __str__(self):
        return self.projectName

class Inventory(models.Model):
    itemId = models.AutoField(primary_key = True)
    itemName = models.CharField(max_length = 100)
    itemCategory = models.ForeignKey(Category, on_delete = models.CASCADE)
    itemQuantity = models.DecimalField(max_digits = 20, decimal_places = 2)
    unitPrice = models.DecimalField(max_digits = 20, decimal_places = 2)
    userId = models.ForeignKey(User,models.SET_NULL, blank = True, null = True)
    projectId = models.ForeignKey(Project, on_delete = models.CASCADE)
    unit = models.CharField(max_length = 100)

    def __str__(self):
        return self.itemName

class PurchaseHeader(models.Model):
    purchaseHeaderId = models.AutoField(primary_key = True)
    purchaseNo = models.CharField(max_length = 100)
    payment_method = models.CharField(max_length = 100)
    details = models.TextField()
    tax = models.DecimalField(max_digits = 20, decimal_places = 2)
    accountId = models.ForeignKey(ChartOfAccount, on_delete = models.CASCADE)
    userId = models.ForeignKey(User,models.SET_NULL, blank = True, null = True)
    projectId = models.ForeignKey(Project, on_delete = models.CASCADE)

    def __str__(self):
        return self.purchaseNo

class PurchaseDetail(models.Model):
    purchaseDetailId = models.AutoField(primary_key = True)
    purchaseQuantity = models.DecimalField(max_digits = 20, decimal_places = 2)
    purchasePrice = models.DecimalField(max_digits = 20, decimal_places = 2)
    total = models.DecimalField(max_digits = 20, decimal_places = 3, blank=True, null=True)
    itemId = models.ForeignKey(Inventory, on_delete = models.CASCADE)
    purchaseHeaderId = models.ForeignKey(PurchaseHeader, on_delete = models.CASCADE)

class VoucherHeader(models.Model):
    voucherId = models.AutoField(primary_key = True)
    voucherNo = models.CharField(max_length = 100)
    date = models.DateField(default = datetime.date.today)
    docNo = models.CharField(max_length = 100)
    docDate = models.DateField(default = datetime.date.today)
    chequeNo = models.CharField(max_length = 100)
    chequeDate = models.DateField(max_length = datetime.date.today)
    description = models.TextField()
    userId = models.ForeignKey(User,models.SET_NULL, blank = True, null = True)
    projectId = models.ForeignKey(Project, on_delete = models.CASCADE)
    accountId = models.ForeignKey(ChartOfAccount, models.SET_NULL,blank=True,null=True)

class VoucherDetail(models.Model):
    accountId = models.ForeignKey(ChartOfAccount, models.SET_NULL,blank=True,null=True)
    debit = models.DecimalField(max_digits = 20, decimal_places = 2)
    credit = models.DecimalField(max_digits = 20, decimal_places = 2)
    invoiceId = models.IntegerField()
    voucherId = models.ForeignKey(VoucherHeader, on_delete = models.CASCADE)

class Transactions(models.Model):
    transactionId = models.AutoField(primary_key = True)
    refrenceId = models.CharField(max_length = 100)
    refrenceDate = models.DateField(blank = True)
    accountId = models.ForeignKey(ChartOfAccount, models.SET_NULL,blank=True,null=True)
    tranType = models.CharField(max_length = 100)
    amount = models.DecimalField(max_digits = 20, decimal_places = 2)
    date = models.DateField(default = datetime.date.today)
    refInvTranId = models.IntegerField()
    refInvTranType = models.CharField(max_length = 100)
    remarks = models.CharField(max_length = 100)
    voucherId = models.CharField(max_length = 100)
    userId = models.ForeignKey(User,models.SET_NULL, blank = True, null = True)
    project_id = models.IntegerField()


class CompanyInfo(models.Model):
    companyName = models.CharField(max_length = 100)
    companyAddress = models.TextField()
    companyLogo = models.ImageField(default='default.jpg', upload_to='company_logo')
    phoneNo = models.CharField(max_length = 100)
    mobileNo = models.CharField(max_length = 100)
    email = models.CharField(max_length = 100)
    website = models.CharField(max_length = 100)
