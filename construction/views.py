from django.shortcuts import render, redirect
from django.contrib.auth.models import User
from django.http import JsonResponse,HttpResponse
from django.core import serializers
from django.contrib import messages
import mysql.connector
from django.db import connection
from django.db.models import Q, Sum
from .utils import render_to_pdf
import json
from num2words import num2words
from django.views.generic import DeleteView, UpdateView
import datetime
from django.contrib.auth.mixins import LoginRequiredMixin, UserPassesTestMixin
from .models import (
    Category, Project, ChartOfAccount, Inventory, VoucherHeader, Transactions, VoucherDetail,
    CompanyInfo, PurchaseHeader, PurchaseDetail
)
from django.contrib.auth.decorators import login_required
from decimal import Decimal
from django.db import transaction

conn = mysql.connector.connect(user='admin', host='localhost', port='3306', password='Gre@ter834', database="Indus")


def flush_transaction():
    transaction.commit()


@login_required
def home(request):
    return render(request,'construction/home.html',{'title':'Home'})

# @login_required(login_url='Login')
# def addInventory(request):
    # itemCategory = Category.objects.all()
#     projectId = Project.objects.all()
#     return render(request,'construction/add-inventory.html',{'title':'Add Inventory','category':itemCategory,'projectId':projectId})

@login_required
def addCategory(request):
    # categories = Category.objects.all()
    # categoriesForTable = serializers.serialize('json',categories)
    if request.method == "POST":
        edit_category = request.POST.get('add-and-edit-category')
        if edit_category == 'add-category':
            categoryGetFromForm = request.POST.get('sub_category_code')
            print(categoryGetFromForm, request.user)
            c = Category(categoryName = categoryGetFromForm, userId= request.user)
            c.save()
        else:
            CategoryId = request.POST.get('categoryIdUpdate')
            CategoryName = request.POST.get('categoryNameUpdate')
            c = Category.objects.get(categoryId = CategoryId)
            c.categoryName = CategoryName
            c.save()
            print(c.categoryName)
        # return JsonResponse({'category':categoriesForTable})
    categories = Category.objects.all()



    return render(request, 'construction/add-category.html',{'title':'Categories', 'category':categories})


@login_required
def addProject(request):
    chartofaccount = ChartOfAccount.objects.all()
    users = User.objects.all()
    itemCategory = Category.objects.all()
    if request.method == "POST":
        projName = request.POST.get("projectName")
        Amount = request.POST.get("amount")
        description = request.POST.get("narration")
        payment_method = request.POST.get("payMethod")
        Client = request.POST.get("client")
        # ItemCategory = request.POST.get("item-category")
        # ItemName = request.POST.get("item-Name")
        # ItemQuantity = request.POST.get("item-Quantity")
        # UnitPrice = request.POST.get("unit-Price")

        proj = Project(projectName=projName,  userId=request.user, amount=Amount, narration=description, payMethod=payment_method, accountId=ChartOfAccount.objects.get(accountId=Client))
        proj.save()

        proj = Project.objects.last()
        print(proj)
        # itemName = request.POST.get("ItemName")
        # itemCategory = request.POST.get("ItemCategory")
        # itemQuantity = request.POST.get("ItemQuantity")
        # unitPrice = request.POST.get("UnitPrice")
        # unit = request.POST.get("Unit")

        items = json.loads(request.POST.get('items'))

        print(items, "\n", projName, Amount, description, payment_method, Client)
        for item in items:
            print(item)
            itemName = item['ItemName']
            itemCategory = Category.objects.get(categoryId =item['ItemCategoryVal'])
            itemQuantity = item['ItemQuantity']
            unitPrice = item['UnitPrice']
            unit = item['Unit']
            item_add = Inventory(itemName = itemName, itemCategory=itemCategory, itemQuantity= itemQuantity, unitPrice=unitPrice,unit=unit, projectId = proj, userId=request.user)
            item_add.save()

        return JsonResponse({'success':'success'})



        # print(projName, Amount, description, payment_method, CLient)
    return render(request, 'construction/add-project.html',{'title':'Add Project','users':users,'category':itemCategory,'accounts':chartofaccount})

# class InventoryDelete(LoginRequiredMixin, DeleteView):
#     model = Inventory
#     template_name = 'construction/inventory.html'
#     success_url = '/'

# def InventoryDelete(request):
#     if method.POST == "POST":
#         id = request.POST.get('itemId')
#         Inventory.objects.filter(id=id).delete()
#         print('deleted')

@login_required
def inventory(request):
    if request.method == "POST":
        inventory_edit_or_delete = request.POST.get("inventory-edit-or-delete")
        if inventory_edit_or_delete == 'add-inventory':
            itemName = request.POST.get('ItemName')
            itemQuantity = request.POST.get('ItemQuantity')
            itemCategory = request.POST.get('ItemCategory')
            unitPrice = request.POST.get('UnitPrice')
            unit = request.POST.get('Unit')
            project = request.POST.get('Project')
            categoryVal = Category.objects.get(categoryId = itemCategory)
            projectVal = Project.objects.get(projectId = project)
            try:
                item_add = Inventory(itemName = itemName, itemCategory=categoryVal, itemQuantity= itemQuantity, unitPrice=unitPrice,unit=unit, projectId = projectVal, userId = request.user)
                item_add.save()
            except Exception as e:
                messages.warning(request, 'Please, Provide integer value not string!')
        else:
            itemName = request.POST.get('ItemNameUpdate')
            itemId = request.POST.get('inventoryIdUpdate')
            itemQuantity = request.POST.get('ItemQuantityUpdate')
            unitPrice = request.POST.get('UnitPriceUpdate')
            unit = request.POST.get('UnitUpdate')
            try:
                item_edit = Inventory.objects.get(itemId = itemId)
                item_edit.itemName = itemName
                item_edit.itemQuantity = itemQuantity
                item_edit.unitPrice = unitPrice
                item_edit.unit = unit
                item_edit.save()
            except Exception as e:
                messages.warning(request, 'something went wrong')
    inventory = Inventory.objects.all()
    category = Category.objects.all()
    projects = Project.objects.all()



    return render(request, 'construction/inventory.html',{'title':'Inventory','inventories':inventory,'category':category,'projects':projects})

@login_required
def chart_of_account(request):
    supplier = Q(account_id = '100')
    customer = Q(account_id = '200')
    bank = Q(account_id = '300')
    main = ChartOfAccount.objects.all()
    sub_accounts = ChartOfAccount.objects.all()
    all_accounts = ChartOfAccount.objects.filter(supplier|customer|bank).all()
    if request.method == 'POST':
        account_title = request.POST.get('account_title')
        account_type = request.POST.get('account_type')
        opening_balance = request.POST.get('opening_balance')
        phone_no = request.POST.get('phone_no')
        email_address = request.POST.get('email_address')
        ntn = request.POST.get('ntn')
        stn = request.POST.get('stn')
        cnic = request.POST.get('cnic')
        address = request.POST.get('address')
        remarks = request.POST.get('remarks')
        op_type = request.POST.get('optradio')
        credit_limits = request.POST.get('credit_limits')

        if credit_limits is "":
            credit_limits = 0.00
        else:
            credit_limits = credit_limits

        if opening_balance is "":
            opening_balance = 0
        if op_type == "credit":
            opening_balance = -abs(Decimal(opening_balance))
        coa = ChartOfAccount(account_title = account_title, parent_id = account_type, opening_balance = opening_balance, phone_no = phone_no, email_address = email_address, ntn = ntn, stn = stn, cnic = cnic ,Address = address, remarks = remarks, credit_limit=credit_limits, account_id = "100")
        coa.save()
    return render(request, 'construction/chart_of_account.html',{'title':'Add Customer','all_accounts':all_accounts})


@login_required
def edit_chart_of_account(request):
    if request.method == 'POST':
        id = request.POST.get('id')
        account_title = request.POST.get('account_title')
        account_type = request.POST.get('account_type')
        opening_balance = request.POST.get('opening_balance')
        phone_no = request.POST.get('phone_no')
        email_address = request.POST.get('email_address')
        ntn = request.POST.get('ntn')
        stn = request.POST.get('stn')
        cnic = request.POST.get('cnic')
        address = request.POST.get('address')
        remarks = request.POST.get('remarks')
        op_type = request.POST.get('optradio')
        credit_limits = request.POST.get('credit_limits')

        if credit_limits is "":
            credit_limits = 0.00
        else:
            credit_limits = credit_limits

        if opening_balance is "":
            opening_balance = 0
        if op_type == "credit":
            opening_balance = -abs(Decimal(opening_balance))
        coa = ChartOfAccount.objects.filter(id = id).first()
        coa.account_title = account_title
        coa.parent_id = account_type
        coa.opening_balance = opening_balance
        coa.phone_no = phone_no
        coa.email_address = email_address
        coa.ntn = ntn
        coa.stn = stn
        coa.cnic = cnic
        coa.Address = address
        coa.remarks = remarks
        coa.credit_limit = credit_limits
        coa.save()
    return redirect('chart-of-account')


def account_transaction_avaliable(pk):
    return True
    # cusror = connection.cursor()
    # row = cusror.execute('''select case
    #                         when exists (select id from supplier_rfqsupplierheader  where account_id_id = %s)
    #                         or exists (select id from supplier_quotationheadersupplier  where account_id_id = %s)
    #                         or exists (select id from supplier_poheadersupplier  where account_id_id = %s)
    #                         or exists (select id from supplier_dcheadersupplier  where account_id_id = %s)
    #                         or exists (select id from customer_rfqcustomerheader  where account_id_id = %s)
    #                         or exists (select id from customer_quotationheadercustomer  where account_id_id = %s)
    #                         or exists (select id from customer_poheadercustomer  where account_id_id = %s)
    #                         or exists (select id from customer_dcheadercustomer  where account_id_id = %s)
    #                         or exists (select id from transaction_purchaseheader  where account_id_id = %s)
    #                         or exists (select id from transaction_purchasereturnheader  where account_id_id = %s)
    #                         or exists (select id from transaction_saleheader  where account_id_id = %s)
    #                         or exists (select id from transaction_salereturnheader  where account_id_id = %s)
    #                         or exists (select id from transaction_transactions  where account_id_id = %s)
    #                         or exists (select id from transaction_voucherdetail  where account_id_id = %s)
    #                         then 'y'
    #                         else 'n'
    #                         end
    #                         ''',[pk,pk,pk,pk,pk,pk,pk,pk,pk,pk,pk,pk,pk,pk])
    # row = row.fetchall()
    # res_list = [x[0] for x in row]
    # if res_list[0] == "n":
    #     ChartOfAccount.objects.filter(id = pk).delete()
    #     return True
    # else:
    #     return False

@login_required
def delete_chart_of_account(request,pk):
    account = account_transaction_avaliable(pk)
    if account == True:
        ChartOfAccount.objects.filter(id = pk).all().delete()
        messages.add_message(request, messages.SUCCESS, "Account Deleted")
        return redirect('chart-of-account')
    else:
        messages.add_message(request, messages.ERROR, "You cannot delete this Account, it is refrenced")
        return redirect('chart-of-account')
    return redirect('chart-of-account')

@login_required
def project(request):
    project = Project.objects.all()
    chartofaccount = ChartOfAccount.objects.all()
    if request.method == "POST":
        project_edit_or_delete = request.POST.get('project-edit-or-delete')
        if project_edit_or_delete == "new-project":
            ProjectName = request.POST.get('projectName')
            AccountId = request.POST.get('customer')
            PaymentMethod = 'Cash'
            Description = request.POST.get('description')
            project_add = Project(projectName=ProjectName, accountId=ChartOfAccount(id=AccountId), payMethod=PaymentMethod, narration=Description, amount=0.0, userId=request.user)
            project_add.save()
        else:
            ProjectId = request.POST.get('projectIdUpdate')
            customerUpdate = request.POST.get('customerUpdate')
            ProjectName = request.POST.get('projectNameUpdate')
            Description = request.POST.get('descriptionUpdate')
            account_id = ChartOfAccount.objects.get(id=customerUpdate)
            p = Project.objects.get(projectId=ProjectId)
            p.accountId = account_id
            p.projectName = ProjectName
            p.narration = Description
            p.save()
    return render(request, 'construction/project.html',{'title':'Projects','projects':project,'chartofaccounts':chartofaccount})

@login_required
def delete_project(request, pk):
    project = Project.objects.filter(projectId=pk).delete()
    print("deleted")
    return redirect('Project')

@login_required
def delete_inventory_category(request, pk):
    category = Category.objects.filter(categoryId=pk).delete()
    print("deleted")
    return redirect('Add-Category')

@login_required
def delete_inventory(request, pk):
    inventory = Inventory.objects.filter(itemId=pk).delete()
    print('deleted')
    return redirect('Inventory')

@login_required
def delete_chartofaccount(request, pk):
    chartofaccount = ChartOfAccount.objects.filter(accountId=pk).delete()
    print('deleted')
    return redirect('Chart-Of-Account')

@login_required
def journal_voucher(request):
    all_voucher = VoucherHeader.objects.filter(voucherNo__contains="JV").all()
    print(all_voucher)
    return render(request, 'construction/journal-voucher.html',{'title':'Journal voucher', 'all_voucher':all_voucher})

@login_required
def journal_voucher_new(request):
    chartofaccount = ChartOfAccount.objects.all()
    projects = Project.objects.all()
    get_last_tran_id = VoucherHeader.objects.filter(voucherNo__contains='JV').last()
    date = datetime.date.today()
    date = date.strftime('%Y%m')
    if get_last_tran_id:
        get_last_tran_id = get_last_tran_id.voucherNo
        get_last_tran_id = get_last_tran_id[6:]
        serial = str((int(get_last_tran_id) + 1))
        get_last_tran_id = date[2:]+'JV'+serial
    else:
        get_last_tran_id =  date[2:]+'JV1'
        voucherId = 1
    if request.POST.get("samp") == "projectUpdate":
        main_object_id = request.POST.get("main_object_id")
        sub_menu = Project.objects.filter(accountId=main_object_id).all()
        sub_menu = serializers.serialize('json',sub_menu)
        return JsonResponse({'sub_menu':sub_menu})
    if request.method == "POST":
        doc_no = request.POST.get('documentNo', False)
        tran_id = request.POST.get('transactionId', False)
        doc_date = request.POST.get('date', False)
        desc = request.POST.get('description', False)
        project_id = request.POST.get('project', False)
        accountId = request.POST.get('accountId', False)
        data = json.loads(request.POST.get('data', False))
        date = datetime.date.today()
        project_id = Project.objects.get(projectId = project_id)
        account_id = ChartOfAccount.objects.get(id = accountId)
        voucher_header = VoucherHeader(voucherNo = tran_id, date = date, docNo = doc_no, docDate = doc_date, chequeNo = "", chequeDate = date, description = desc, userId = request.user, projectId = project_id, accountId = account_id)
        voucher_header.save()
        voucher_id = VoucherHeader.objects.get(voucherNo = tran_id)
        for value in data:
            if value["Debit"] > "0" and value["Debit"] > "0.00":
                account_id = ChartOfAccount.objects.get(id = value["AccountId"])
                tran1 = Transactions(refrenceId = 0, refrenceDate = doc_date, tranType = '', amount = abs(float(value["Debit"])),
                        date = date, remarks = desc, accountId = account_id, refInvTranId = doc_no, refInvTranType = 'JV', voucherId = voucher_id.voucherId, userId = request.user)
                tran1.save()
                jv_detail1 = VoucherDetail(accountId = account_id, debit = abs(float(value["Debit"])), credit = 0.00, voucherId = voucher_id, invoiceId = 0)
                jv_detail1.save()
            if value["Credit"] > "0" and value["Credit"] > "0.00":
                account_id = ChartOfAccount.objects.get(id = value["AccountId"])
                tran2 = Transactions(refrenceId = 0, refrenceDate = doc_date, tranType = '', amount = -abs(float(value["Credit"])),
                        date = date, remarks = desc, accountId = account_id, refInvTranId = doc_no, refInvTranType = 'JV', voucherId = voucher_id.voucherId, userId = request.user)
                tran2.save()
                jv_detail2 = VoucherDetail(accountId = account_id, debit = 0.00, credit = -abs(float(value["Credit"])), voucherId = voucher_id, invoiceId = 0)
                jv_detail2.save()
        return JsonResponse({"Succes":"Succes"})
    return render(request, 'construction/journal-voucher-new.html',{'title':'Add Journal voucher','chartofaccount':chartofaccount, 'get_last_tran_id':get_last_tran_id, 'projects':projects})

@login_required
def delete_journal_voucher(request,pk):
    voucher = VoucherHeader.objects.filter(voucherId=pk).delete()
    tran = Transactions.objects.filter(voucherId=pk).all().delete()
    print('deleted')
    return redirect('Journal-Voucher')

@login_required
def cash_receiving_voucher(request):
    all_voucher = VoucherHeader.objects.filter(voucherNo__contains="CRV").all()
    print(all_voucher)
    return render(request, 'construction/cash-receiving-voucher.html',{'title':'Cash Receiving Voucher','all_voucher':all_voucher})

@login_required
def cash_receiving_voucher_new(request):
    cof = ChartOfAccount.objects.all()
    projects = Project
    cursor = conn.cursor()
    get_last_tran_id = VoucherHeader.objects.filter(voucherNo__contains='CRV').last()
    date = datetime.date.today()
    date = date.strftime('%Y%m')
    if get_last_tran_id:
        get_last_tran_id = get_last_tran_id.voucherNo
        get_last_tran_id = get_last_tran_id[7:]
        get_last_tran_id = int(get_last_tran_id)
        get_last_tran_id = get_last_tran_id+1
        get_last_tran_id = str(get_last_tran_id)
        get_last_tran_id = date[2:] + 'CRV' + get_last_tran_id
    else:
        get_last_tran_id = date[2:]+'CRV1'

    if request.POST.get("samp") == "projectUpdate":
        main_object_id = request.POST.get("main_object_id")
        sub_menu = Project.objects.filter(accountId=main_object_id).all()
        sub_menu = serializers.serialize('json',sub_menu)
        return JsonResponse({'sub_menu':sub_menu})

    if request.POST.get("samp") == "crvTable":
        account_id = request.POST.get("account_id")
        amount = request.POST.get("amount")
        account_id = ChartOfAccount.objects.filter(id = account_id).first()
        return JsonResponse({'account_id':account_id.id, 'account_title':account_id.account_title,'amount':amount})

    if request.method == "POST":
        doc_no = request.POST.get('documentNo', False)
        tran_id = request.POST.get('transactionId', False)
        doc_date = request.POST.get('doc-date', False)
        desc = request.POST.get('description', False)
        project_id = request.POST.get('project', False)
        account_id = request.POST.get('account_id', False)
        data = json.loads(request.POST.get('items', False))
        date = request.POST.get('date', False)
        account_id = ChartOfAccount.objects.get(id = account_id)
        project_id = Project.objects.get(projectId = project_id)
        voucher_header = VoucherHeader(voucherNo = tran_id, date = date, docNo = doc_no, docDate = doc_date, chequeNo = "", chequeDate = date, description = desc, userId = request.user, projectId = project_id, accountId = account_id)
        voucher_header.save()
        voucher_id = VoucherHeader.objects.get(voucherNo = tran_id)
        for value in data:
            account_id = ChartOfAccount.objects.get(id = value["AccountId"])
            tran1 = Transactions(refrenceId = 0, refrenceDate = doc_date, tranType = '', amount = -abs(float(value["Credit"])),
                    date = date, remarks = desc, accountId = account_id, refInvTranId = doc_no, refInvTranType = 'CRV', voucherId = voucher_id.voucherId, userId = request.user)
            tran1.save()
            jv_detail1 = VoucherDetail(accountId = account_id, debit = 0.00, credit = -abs(float(value["Credit"])), voucherId = voucher_id, invoiceId = 0)
            jv_detail1.save()

            account_id = ChartOfAccount.objects.get(id = 4)
            tran2 = Transactions(refrenceId = 0, refrenceDate = doc_date, tranType = '', amount = abs(float(value["Credit"])),
                    date = date, remarks = desc, accountId = account_id, refInvTranId = doc_no, refInvTranType = 'CRV', voucherId = voucher_id.voucherId, userId = request.user)
            tran2.save()
            jv_detail2 = VoucherDetail(accountId = account_id, debit = abs(float(value["Credit"])), credit = 0.00, voucherId = voucher_id, invoiceId = 0)
            jv_detail2.save()
        return JsonResponse({"Succes":"Succes"})
    return render(request, 'construction/cash-receiving-voucher-new.html',{'title':'Cash Receiving Add', 'get_last_tran_id':get_last_tran_id,'chartofaccount':cof})

@login_required
def bank_receiving_voucher(request):
    all_voucher = VoucherHeader.objects.filter(voucherNo__contains="BRV").all()
    return render(request, 'construction/bank_receiving_voucher.html',{'title':'Bank Receiving Voucher','all_voucher':all_voucher})

@login_required
def bank_receiving_voucher_new(request):
    all_bank_accounts = ChartOfAccount.objects.filter(account_id = 100).all()
    cof = ChartOfAccount.objects.all()
    get_last_tran_id = VoucherHeader.objects.filter(voucherNo__contains='BRV').last()
    date = datetime.date.today()
    date = date.strftime('%Y%m')
    if get_last_tran_id:
        get_last_tran_id = get_last_tran_id.voucherNo
        get_last_tran_id = get_last_tran_id[7:]
        get_last_tran_id = int(get_last_tran_id)
        get_last_tran_id = get_last_tran_id+1
        get_last_tran_id = str(get_last_tran_id)
        get_last_tran_id = date[2:] + 'BRV' + get_last_tran_id
    else:
        get_last_tran_id = date[2:]+'BRV1'
    if request.POST.get("samp"):
        main_object_id = request.POST.get("main_object_id")
        sub_menu = Project.objects.filter(accountId=main_object_id).all()
        sub_menu = serializers.serialize('json',sub_menu)
        return JsonResponse({'sub_menu':sub_menu})

    if request.method == "POST":
        tran_id = request.POST.get('transactionId', False)
        doc_date = request.POST.get('doc-date', False)
        desc = request.POST.get('description', False)
        cheque_no = request.POST.get('cheque_no', False)
        cheque_date = request.POST.get('cheque_date', False)
        project_id = request.POST.get('project', False)
        account_id = request.POST.get('account_id', False)
        data = json.loads(request.POST.get('items', False))
        date = request.POST.get('date', False)
        bank_account = request.POST.get('bank_account', False)
        account_id = ChartOfAccount.objects.get(id = account_id)
        bank_account = ChartOfAccount.objects.get(id = bank_account)
        project_id = Project.objects.get(projectId = project_id)
        voucher_header = VoucherHeader(voucherNo = tran_id, date = date, docNo = cheque_no, docDate = doc_date, chequeNo = cheque_no, chequeDate = cheque_date, description = desc, userId = request.user, projectId = project_id, accountId = account_id)
        voucher_header.save()
        voucher_id = VoucherHeader.objects.get(voucherNo = tran_id)
        for value in data:
            account_id = ChartOfAccount.objects.get(id = value["AccountId"])
            tran1 = Transactions(refrenceId = 0, refrenceDate = doc_date, tranType = '', amount = -abs(float(value["Credit"])),
                    date = date, remarks = desc, accountId = account_id, refInvTranId = cheque_no, refInvTranType = 'BRV', voucherId = voucher_id.voucherId, userId = request.user)
            tran1.save()
            jv_detail1 = VoucherDetail(accountId = account_id, debit = 0.00, credit = -abs(float(value["Credit"])), voucherId = voucher_id, invoiceId = 0)
            jv_detail1.save()

            tran2 = Transactions(refrenceId = 0, refrenceDate = doc_date, tranType = '', amount = abs(float(value["Credit"])),
                    date = date, remarks = desc, accountId = bank_account, refInvTranId = cheque_no, refInvTranType = 'BRV', voucherId = voucher_id.voucherId, userId = request.user)
            tran2.save()
            jv_detail2 = VoucherDetail(accountId = bank_account, debit = abs(float(value["Credit"])), credit = 0.00, voucherId = voucher_id, invoiceId = 0)
            jv_detail2.save()
        return JsonResponse({"success":"success"})
    return render(request, 'construction/bank_receiving_voucher_new.html',{'title':'Bank Receiving Add','cof':cof, 'get_last_tran_id':get_last_tran_id,'all_bank_accounts':all_bank_accounts})

@login_required
def cash_payment_voucher(request):
    all_voucher = VoucherHeader.objects.filter(voucherNo__contains="CPV").all()
    return render(request, 'construction/cash_payment_voucher.html',{'title':'Cash Payment Voucher','all_voucher':all_voucher})

@login_required
def cash_payment_voucher_new(request):
    cof = ChartOfAccount.objects.all()
    cursor = conn.cursor()
    get_last_tran_id = VoucherHeader.objects.filter(voucherNo__contains='CPV').last()
    date = datetime.date.today()
    date = date.strftime('%Y%m')
    if get_last_tran_id:
        get_last_tran_id = get_last_tran_id.voucherNo
        get_last_tran_id = get_last_tran_id[7:]
        get_last_tran_id = int(get_last_tran_id)
        get_last_tran_id = get_last_tran_id+1
        get_last_tran_id = str(get_last_tran_id)
        get_last_tran_id = date[2:] + 'CPV' + get_last_tran_id
    else:
        get_last_tran_id = date[2:]+'CPV1'

    if request.POST.get("samp"):
        main_object_id = request.POST.get("main_object_id")
        print(main_object_id)
        sub_menu = Project.objects.filter(accountId=main_object_id).all()
        sub_menu = serializers.serialize('json',sub_menu)
        print('here', sub_menu)
        return JsonResponse({'sub_menu':sub_menu})

    if request.method == "POST":
        doc_no = request.POST.get('documentNo', False)
        tran_id = request.POST.get('transactionId', False)
        doc_date = request.POST.get('doc-date', False)
        desc = request.POST.get('description', False)
        project_id = request.POST.get('project', False)
        account_id = request.POST.get('account_id', False)
        data = json.loads(request.POST.get('items', False))
        date = request.POST.get('date', False)
        account_id = ChartOfAccount.objects.get(id = account_id)
        project_id = Project.objects.get(projectId = project_id)
        voucher_header = VoucherHeader(voucherNo = tran_id, date = date, docNo = doc_no, docDate = doc_date, chequeNo = "", chequeDate = date, description = desc, userId = request.user, projectId = project_id, accountId = account_id)
        voucher_header.save()
        voucher_id = VoucherHeader.objects.get(voucherNo = tran_id)
        for value in data:
            account_id = ChartOfAccount.objects.get(id = value["AccountId"])
            tran1 = Transactions(refrenceId = 0, refrenceDate = doc_date, tranType = '', amount = abs(float(value["Debit"])),
                    date = date, remarks = desc, accountId = account_id, refInvTranId = doc_no, refInvTranType = 'CPV', voucherId = voucher_id.voucherId, userId = request.user)
            tran1.save()
            jv_detail1 = VoucherDetail(accountId = account_id, debit = abs(float(value["Debit"])), credit = 0.00, voucherId = voucher_id, invoiceId = 0)
            jv_detail1.save()

            account_id = ChartOfAccount.objects.get(id = 4)
            tran2 = Transactions(refrenceId = 0, refrenceDate = doc_date, tranType = '', amount = -abs(float(value["Debit"])),
                    date = date, remarks = desc, accountId = account_id, refInvTranId = doc_no, refInvTranType = 'CPV', voucherId = voucher_id.voucherId, userId = request.user)
            tran2.save()
            jv_detail2 = VoucherDetail(accountId = account_id, debit = 0.00, credit = -abs(float(value["Debit"])), voucherId = voucher_id, invoiceId = 0)
            jv_detail2.save()
        return JsonResponse({"Succes":"Succes"})
    return render(request, 'construction/cash_payment_voucher_new.html',{'title':'Cash Payment Voucher Add', 'cof':cof, 'get_last_tran_id':get_last_tran_id})

@login_required
def bank_payment_voucher(request):
    all_voucher = VoucherHeader.objects.filter(voucherNo__contains="BPV").all()
    return render(request, 'construction/bank_payment_voucher.html',{'title':'Bank Payment Voucher','all_voucher':all_voucher})

@login_required
def bank_payment_voucher_new(request):
    all_bank_accounts = ChartOfAccount.objects.filter(account_id = 100).all()
    get_last_tran_id = VoucherHeader.objects.filter(voucherNo__contains='BPV').last()
    cof = ChartOfAccount.objects.all()
    cursor = conn.cursor()
    get_last_tran_id = cursor.execute('''select * from construction_voucherheader where voucherNo LIKE "%BPV%" order by voucherNo DESC LIMIT 1 ''')
    get_last_tran_id = cursor.fetchall()
    date = datetime.date.today()
    date = date.strftime('%Y%m')
    if get_last_tran_id:
        get_last_tran_id = get_last_tran_id[0][1]
        get_last_tran_id = get_last_tran_id
        get_last_tran_id = get_last_tran_id[7:]
        print(get_last_tran_id)
        get_last_tran_id = int(get_last_tran_id)
        get_last_tran_id = get_last_tran_id+1
        get_last_tran_id = str(get_last_tran_id)
        get_last_tran_id = date[2:] + 'BPV' + get_last_tran_id
    else:
        get_last_tran_id = date[2:]+'BPV1'

    if request.POST.get("samp"):
        main_object_id = request.POST.get("main_object_id")
        sub_menu = Project.objects.filter(accountId=main_object_id).all()
        sub_menu = serializers.serialize('json',sub_menu)
        return JsonResponse({'sub_menu':sub_menu})

    if request.method == "POST":
        tran_id = request.POST.get('transactionId', False)
        doc_date = request.POST.get('doc-date', False)
        desc = request.POST.get('description', False)
        cheque_no = request.POST.get('cheque_no', False)
        cheque_date = request.POST.get('cheque_date', False)
        project_id = request.POST.get('project', False)
        account_id = request.POST.get('account_id', False)
        data = json.loads(request.POST.get('items', False))
        date = request.POST.get('date', False)
        bank_account = request.POST.get('bank_account', False)
        account_id = ChartOfAccount.objects.get(id = account_id)
        bank_account = ChartOfAccount.objects.get(id = bank_account)
        project_id = Project.objects.get(projectId = project_id)
        voucher_header = VoucherHeader(voucherNo = tran_id, date = date, docNo = cheque_no, docDate = doc_date, chequeNo = cheque_no, chequeDate = cheque_date, description = desc, userId = request.user, projectId = project_id, accountId = account_id)
        voucher_header.save()
        voucher_id = VoucherHeader.objects.get(voucherNo = tran_id)
        for value in data:
            account_id = ChartOfAccount.objects.get(id = value["AccountId"])
            tran1 = Transactions(refrenceId = 0, refrenceDate = doc_date, tranType = '', amount = abs(float(value["Debit"])),
                    date = date, remarks = desc, accountId = account_id, refInvTranId = cheque_no, refInvTranType = 'BPV', voucherId = voucher_id.voucherId, userId = request.user)
            tran1.save()
            jv_detail1 = VoucherDetail(accountId = account_id, debit = abs(float(value["Debit"])), credit = 0.00, voucherId = voucher_id, invoiceId = 0)
            jv_detail1.save()

            tran2 = Transactions(refrenceId = 0, refrenceDate = doc_date, tranType = '', amount = -abs(float(value["Debit"])),
                    date = date, remarks = desc, accountId = bank_account, refInvTranId = cheque_no, refInvTranType = 'BPV', voucherId = voucher_id.voucherId, userId = request.user)
            tran2.save()
            jv_detail2 = VoucherDetail(accountId = bank_account, debit = 0.00, credit = -abs(float(value["Debit"])), voucherId = voucher_id, invoiceId = 0)
            jv_detail2.save()
        return JsonResponse({"success":"success"})
    return render(request, 'construction/bank_payment_voucher_new.html',{'title':'Bank Payment Voucher New','cof':cof,'get_last_tran_id':get_last_tran_id,'all_bank_accounts':all_bank_accounts})

@login_required
def jv_pdf(request, pk):
    company_info = CompanyInfo.objects.all()
    header = VoucherHeader.objects.filter(voucherId = pk).first()
    detail = VoucherDetail.objects.filter(voucherId = header.voucherId).all()
    debit = VoucherDetail.objects.filter(voucherId = header.voucherId).aggregate(Sum('debit'))
    credit = VoucherDetail.objects.filter(voucherId = header.voucherId).aggregate(Sum('credit'))
    pdf = render_to_pdf('construction/jv_pdf.html', {'company_info':company_info, 'header':header, 'detail':detail, "debit":debit, "credit":credit})
    if pdf:
        response = HttpResponse(pdf, content_type='application/pdf')
        filename = "Journal_Voucher.pdf"
        content = "inline; filename='%s'" %(filename)
        response['Content-Disposition'] = content
        return response
    return HttpResponse("Not found")

@login_required
def crv_pdf(request, pk):
    company_info = CompanyInfo.objects.all()
    header = VoucherHeader.objects.filter(voucherId = pk).first()
    details = VoucherDetail.objects.filter(debit = 0,voucherId = header.voucherId).first()
    print("Here is ",details)
    cursor = connection.cursor()
    detail = cursor.execute('''select sum(VD.credit) as Amount,COA.account_title, COA.id
                            from  construction_voucherdetail VD
                            inner join construction_voucherheader VH on VH.voucherId = VD.voucherId_id
                            inner join construction_chartofaccount COA on VD.accountId_id = COA.id
                            where VD.voucherId_id = %s AND VD.accountId_id = %s
                            group by COA.id;
                            ''',[header.voucherId,details.accountId.id])
    detail = cursor.fetchall()
    amount_in_words =  num2words(abs(detail[0][0]))
    pdf = render_to_pdf('construction/crv_pdf.html', {'company_info':company_info, 'header':header, 'detail':detail, 'amount_in_words':amount_in_words})
    if pdf:
        response = HttpResponse(pdf, content_type='application/pdf')
        filename = "CashReceivingVoucher.pdf"
        content = "inline; filename='%s'" %(filename)
        response['Content-Disposition'] = content
        return response
    return HttpResponse("Not found")

@login_required
def brv_pdf(request, pk):
    company_info = CompanyInfo.objects.all()
    header = VoucherHeader.objects.filter(voucherId = pk).first()
    details = VoucherDetail.objects.filter(debit = 0,voucherId = header.voucherId).first()
    # bank = ChartOfAccount.objects.filter(account_id = '200')
    print("Here is ",details)
    cursor = connection.cursor()
    detail = cursor.execute('''select sum(VD.credit) as Amount,COA.account_title, COA.id
                            from  construction_voucherdetail VD
                            inner join construction_voucherheader VH on VH.voucherId = VD.voucherId_id
                            inner join construction_chartofaccount COA on VD.accountId_id = COA.id
                            where VD.voucherId_id = %s AND VD.accountId_id = %s
                            group by COA.id;
                            ''',[header.voucherId,details.accountId.id])
    detail = cursor.fetchall()
    amount_in_words =  num2words(abs(detail[0][0]))
    pdf = render_to_pdf('construction/brv_pdf.html', {'company_info':company_info, 'header':header, 'detail':detail, 'amount_in_words':amount_in_words})
    if pdf:
        response = HttpResponse(pdf, content_type='application/pdf')
        filename = "BankReceivingVoucher.pdf"
        content = "inline; filename='%s'" %(filename)
        response['Content-Disposition'] = content
        return response
    return HttpResponse("Not found")

@login_required
def bpv_pdf(request, pk):
    company_info = CompanyInfo.objects.all()
    header = VoucherHeader.objects.filter(voucherId = pk).first()
    details = VoucherDetail.objects.filter(debit = 0,voucherId = header.voucherId).first()
    # bank = ChartOfAccount.objects.filter(account_id = '200')
    print("Here is ",details)
    cursor = connection.cursor()
    detail = cursor.execute('''select sum(VD.credit) as Amount,COA.account_title, COA.id
                            from  construction_voucherdetail VD
                            inner join construction_voucherheader VH on VH.voucherId = VD.voucherId_id
                            inner join construction_chartofaccount COA on VD.accountId_id = COA.id
                            where VD.voucherId_id = %s AND VD.accountId_id = %s
                            group by COA.id;
                            ''',[header.voucherId,details.accountId.id])
    detail = cursor.fetchall()
    amount_in_words =  num2words(abs(detail[0][0]))
    pdf = render_to_pdf('construction/brv_pdf.html', {'company_info':company_info, 'header':header, 'detail':detail, 'amount_in_words':amount_in_words})
    if pdf:
        response = HttpResponse(pdf, content_type='application/pdf')
        filename = "BankPaymentVoucher.pdf"
        content = "inline; filename='%s'" %(filename)
        response['Content-Disposition'] = content
        return response
    return HttpResponse("Not found")


@login_required
def purchase(request):
    return render(request, 'construction/purchase.html',{'title':'Purchase'})

@login_required
def purchase_new(request):
    inventory = Inventory.objects.all()
    cof = ChartOfAccount.objects.all()
    get_last_purchase_no = PurchaseHeader.objects.all().last()
    if get_last_purchase_no:
        get_last_purchase_no = get_last_purchase_no.purchaseNo
        num = int(get_last_purchase_no)
        num = num + 1
        get_last_purchase_no = str(num)
    else:
        get_last_purchase_no = '100'
    print(get_last_purchase_no)

    if request.method == "POST":
        if request.POST.get('samp') == 'projectUpdate':
            main_object_id = request.POST.get("main_object_id")
            print(main_object_id)
            sub_menu = Project.objects.filter(accountId=main_object_id).all()
            sub_menu = serializers.serialize('json',sub_menu)
            return JsonResponse({'sub_menu':sub_menu})
        elif request.POST.get('samp') == 'purchaseTable':
            main_object_id = request.POST.get('main_object_id')
            sub_menu = Inventory.objects.filter(itemId = main_object_id)
            sub_menu = serializers.serialize('json',sub_menu)
            return JsonResponse({'sub_menu':sub_menu})
        else:
            print("hello")
            items = json.loads(request.POST.get('main_object_id'))
            payMethod = request.POST.get('paymentMethod')
            client = request.POST.get('client')
            project = request.POST.get('project')

            print(payMethod, client, project)

            p = PurchaseHeader(purchaseNo=get_last_purchase_no, payment_method=payMethod, details="", tax=0.00, accountId= ChartOfAccount.objects.get(account_title=client), userId=request.user, projectId=Project.objects.get(projectId=project))
            p.save()


            # print()
            print(items)
            for item in items:
                itemCode = item['ItemCode']
                Desc = item['Desc']
                Qty = item['Qty']
                Price = item['Price']
                ST = item['ST']
                s = PurchaseDetail(purchaseQuantity=Qty,purchasePrice=Price,total=((int(Qty)*int(Price))+(int(Price)*(int(ST)/100))),itemId=Inventory.objects.get(itemId=itemCode),purchaseHeaderId=PurchaseHeader.objects.get(purchaseNo=get_last_purchase_no))
                s.save()
                print('Added')
                return JsonResponse({'success':'success'})

    return render(request, 'construction/purchase-new.html',{'title':'Purchase New','inventory':inventory,'cof':cof, 'get_last_purchase_no':get_last_purchase_no})

@login_required
def cpv_pdf(request, pk):
    company_info = CompanyInfo.objects.all()
    header = VoucherHeader.objects.filter(voucherId = pk).first()
    details = VoucherDetail.objects.filter(debit = 0,voucherId = header.voucherId).first()
    print("Here is ",details)
    cursor = connection.cursor()
    detail = cursor.execute('''select sum(VD.credit) as Amount,COA.account_title, COA.id
                            from  construction_voucherdetail VD
                            inner join construction_voucherheader VH on VH.voucherId = VD.voucherId_id
                            inner join construction_chartofaccount COA on VD.accountId_id = COA.id
                            where VD.voucherId_id = %s AND VD.accountId_id = %s
                            group by COA.id;
                            ''',[header.voucherId,details.accountId.id])
    detail = cursor.fetchall()
    amount_in_words =  num2words(abs(detail[0][0]))
    pdf = render_to_pdf('construction/cpv_pdf.html', {'company_info':company_info, 'header':header, 'detail':detail, 'amount_in_words':amount_in_words})
    if pdf:
        response = HttpResponse(pdf, content_type='application/pdf')
        filename = "CashPaymentVoucher.pdf"
        content = "inline; filename='%s'" %(filename)
        response['Content-Disposition'] = content
        return response
    return HttpResponse("Not found")

@login_required
def delete_cash_receiving_voucher(request, pk):
    vc = VoucherHeader.objects.filter(voucherId=pk).delete()
    tran = Transactions.objects.filter(voucherId=pk).all().delete()
    print("deleted")
    return redirect('Cash-Receiving-Voucher')

@login_required
def delete_bank_receiving_voucher(request, pk):
    vc = VoucherHeader.objects.filter(voucherId=pk).delete()
    tran = Transactions.objects.filter(voucherId=pk).all().delete()
    print("deleted")
    return redirect('Bank-Receiving-Voucher')

@login_required
def delete_cash_payment_voucher(request, pk):
    vc = VoucherHeader.objects.filter(voucherId=pk).delete()
    tran = Transactions.objects.filter(voucherId=pk).all().delete()
    print("deleted")
    return redirect('Cash-Payment-Vocher')

@login_required
def delete_bank_payment_voucher(request, pk):
    vc = VoucherHeader.objects.filter(voucherId=pk).delete()
    tran = Transactions.objects.filter(voucherId=pk).all().delete()
    print("deleted")
    return redirect('Bank-Payment-Voucher')

@login_required
def view_journal_voucher(request, pk):
    jv_header = VoucherHeader.objects.filter(voucherId = pk).first()
    jv_detail = VoucherDetail.objects.filter(voucherId = jv_header).all()
    print(jv_header, jv_detail)
    return render(request, 'construction/view-journal-voucher.html', {'title':f'View JV{pk}','jv_header':jv_header,'jv_detail':jv_detail})

@login_required
def view_cash_receiving_voucher(request, pk):
    jv_header = VoucherHeader.objects.filter(voucherId = pk).first()
    jv_detail = VoucherDetail.objects.filter(voucherId = jv_header).all()
    print(jv_header, jv_detail)
    return render(request, 'construction/view-cash-receiving-voucher.html', {'title':f'View CRV{pk}','voucher_header':jv_header,'voucher_detail':jv_detail})

@login_required
def view_bank_receiving_voucher(request, pk):
    jv_header = VoucherHeader.objects.filter(voucherId = pk).first()
    jv_detail = VoucherDetail.objects.filter(voucherId = jv_header).all()
    print(jv_header, jv_detail)
    return render(request, 'construction/view-bank-receiving-voucher.html', {'title':f'View BRV{pk}','voucher_header':jv_header,'voucher_detail':jv_detail})

@login_required
def view_cash_payment_voucher(request, pk):
    jv_header = VoucherHeader.objects.filter(voucherId = pk).first()
    jv_detail = VoucherDetail.objects.filter(voucherId = jv_header).all()
    print(jv_header, jv_detail)
    return render(request, 'construction/view-cash-payment-voucher.html', {'title':f'View CPV{pk}','voucher_header':jv_header,'voucher_detail':jv_detail})

@login_required
def view_bank_payment_voucher(request, pk):
    jv_header = VoucherHeader.objects.filter(voucherId = pk).first()
    jv_detail = VoucherDetail.objects.filter(voucherId = jv_header).all()
    print(jv_header, jv_detail)
    return render(request, 'construction/view-bank-payment-voucher.html', {'title':f'View BPV{pk}','voucher_header':jv_header,'voucher_detail':jv_detail})

@login_required
def report(request):
    all_accounts = ChartOfAccount.objects.all()
    return render(request, 'construction/reports.html', {'title':'Reports','all_accounts':all_accounts})

@login_required
def sale_summary_item_wise(request):
    total = 0
    if request.method == "POST":
        from_date = request.POST.get('from_date')
        to_date = request.POST.get('to_date')
        account_id = request.POST.get('account_id')
        print(account_id)
        company_info = CompanyInfo.objects.filter(id = 1).first()
        print(company_info)
        # image = Company_info.objects.filter(company_name = "Hamza Enterprise").first()
        all_accounts = ChartOfAccount.objects.all()
        cursor = connection.cursor()
        cursor.execute('''Select item_code, item_name, item_description,Sum(Total) As TotalAmount From (
                            select IP.product_code as item_code , IP.product_name as item_name, IP.product_desc as item_description, sum(SD.cost_price * SD.quantity) As Total
                            from transaction_saleheader SH
                            inner join inventory_add_products IP on IP.id = SD.item_id_id
                            inner join transaction_saledetail SD
                            on SD.sale_id_id = SH.id
                            where SH.date Between %s And %s
                            Group by item_code
                            Union All
                            select IP.product_code as item_code, IP.product_name as item_name, IP.product_desc as item_description, sum(SRD.cost_price * SRD.quantity) As Total
                            from transaction_salereturnheader SRH
                            inner join inventory_add_products IP on IP.id = SRD.item_id_id
                            inner join transaction_salereturndetail SRD
                            on SRD.sale_return_id_id = SRH.id
                            where SRH.date Between %s And %s
                            Group by item_code
                            ) tblData
                            group by item_code
                             ''',[from_date, to_date,from_date, to_date, account_id])
        row = cursor.fetchall()
        for value in row:
            total = total + value[5]
        account_id = ChartOfAccount.objects.filter(id = account_id).first()
        account_title = account_id.account_title
        pdf = render_to_pdf('transaction/sale_summary_item_wise_pdf.html', {'company_info':company_info,'image':image,'row':row,'from_date':from_date, 'to_date':to_date,'total':total, 'all_accounts':all_accounts, 'account_title':account_title,'allow_customer_roles':allow_customer_roles,'allow_supplier_roles':allow_supplier_roles,'allow_transaction_roles':allow_transaction_roles,'allow_inventory_roles':allow_inventory_roles,    'allow_report_roles':report_roles(request.user),'is_superuser':request.user.is_superuser})
        if pdf:
            response = HttpResponse(pdf, content_type='application/pdf')
            filename = "Sale_Detail_Item_Wise%s.pdf" %("000")
            content = "inline; filename='%s'" %(filename)
            response['Content-Disposition'] = content
            return response
        return HttpResponse("Not found")
    return redirect('report')

@login_required
def account_ledger(request):
    pass

@login_required
def trial_balance(request):
    if request.method == "POST":
        debit_amount = 0
        credit_amount = 0
        from_date = request.POST.get('from_date')
        to_date = request.POST.get('to_date')
        print(from_date, to_date)
        company_info = CompanyInfo.objects.filter(id=1).all()
        cursor = connection.cursor()
        cursor.execute('''Select id,account_title,ifnull(amount,0) + opening_balance As Amount
                        from construction_chartofaccount
                        Left Join
                        (select accountId_id,sum(Amount) As Amount from construction_transactions
                        Where construction_transactions.date Between %s And %s
                        Group By accountId_id) As tbltran On construction_chartofaccount.id = tbltran.accountId_id
                        ''',[from_date, to_date])
                        # 'allow_customer_roles':allow_customer_roles,'allow_supplier_roles':allow_supplier_roles,'allow_transaction_roles':allow_transaction_roles,'allow_inventory_roles':allow_inventory_roles,    'allow_report_roles':report_roles(request.user),'is_superuser':request.user.is_superuser
        row = cursor.fetchall()
        for v in row:
            if v[2] >= 0:
                debit_amount = debit_amount + v[2]
            else:
                credit_amount = credit_amount + v[2]
        pdf = render_to_pdf('construction/trial_balance_pdf.html', {'company_info':company_info,'row':row, 'debit_amount':debit_amount, 'credit_amount': credit_amount,'from_date':from_date,'to_date':to_date})
        if pdf:
            response = HttpResponse(pdf, content_type='application/pdf')
            filename = "TrialBalance%s.pdf" %("000")
            content = "inline; filename='%s'" %(filename)
            response['Content-Disposition'] = content
            return response
        return HttpResponse("Not found")
    return redirect('Report')

@login_required
def sale_detail_item_wise(request):
    pass
