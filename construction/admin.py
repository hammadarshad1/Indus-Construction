from django.contrib import admin
from .models import (
    Category, Project, ChartOfAccount, Inventory, VoucherHeader, Transactions, VoucherDetail,CompanyInfo,PurchaseHeader,PurchaseDetail
)

# Register your models here.
admin.site.register(Category)
admin.site.register(CompanyInfo)
admin.site.register(Project)
admin.site.register(ChartOfAccount)
admin.site.register(Inventory)
admin.site.register(VoucherHeader)
admin.site.register(Transactions)
admin.site.register(VoucherDetail)
admin.site.register(PurchaseHeader)
admin.site.register(PurchaseDetail)
