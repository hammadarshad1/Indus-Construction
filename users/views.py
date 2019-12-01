from django.shortcuts import render, redirect
from django.contrib import messages
from django.core import serializers
from django.http import JsonResponse, HttpResponse
import mysql.connector
from .forms import (UserRegisterForm, UserUpdateForm, ProfileUpdateForm)
from django.contrib.auth.views import LoginView
from django.contrib.auth.models import User
from django.contrib.auth.decorators import login_required, user_passes_test
from . import models
import json


# Create your views here.

def connection():
    conn = mysql.connector.connect(user='admin', host='localhost', port='3306', password='Gre@ter834', database="Indus")
    return conn

def Is_superuser(user):
    return True if user.is_superuser else False

def register(request):
    if request.method == "POST":
        form = UserRegisterForm(request.POST)
        if form.is_valid():
            form.save()
            # username = form.cleaned_data.get('username')
            messages.success(request, f'Your Account has been created! now you can login to your account')
            c = models.Profile(user = User.objects.all().last())
            c.save()
            return redirect('user-list')
    else:
        form = UserRegisterForm()

    return render(request,'users/register.html',{'form':form, 'title':'Register'})

@login_required
def user_list(request):
    all_user = User.objects.all()
    if request.method == 'POST':
        FirstName = request.POST.get('firstName')
        LastName = request.POST.get('lastName')
        UserName = request.POST.get('userName')
        Email = request.POST.get('email')
        Id = request.POST.get('userIdUpdate')
        print(Id)
        usr = User.objects.get(id = Id)
        usr.first_name = FirstName
        usr.last_name = LastName
        usr.userName = UserName
        usr.email = Email
        usr.save()
    return render(request, 'users/users.html',{'all_user':all_user, 'title':'Users'})

@login_required
@user_passes_test(Is_superuser)
def delete_user_roles(request,pk):
    user = User.objects.get(id= pk)
    if user.is_superuser:
        print("SUPER USER CANT DELETE")
        messages.add_message(request, messages.ERROR, "Permission to delete denied.")
    else:
        User.objects.filter(id= pk).all().delete()
        messages.add_message(request, messages.SUCCESS, "User Deleted.")
    return redirect('user-list')

@login_required
def profile(request):
    if request.method == "POST":
        u_form = UserUpdateForm(request.POST, instance=request.user)
        p_form = ProfileUpdateForm(request.POST, request.FILES, instance=request.user.profile)
        if u_form.is_valid() and p_form.is_valid():
            u_form.save()
            p_form.save()
            messages.success(request, f'Your account has been updated!')
            return redirect('Profile')
    else:
        u_form = UserUpdateForm(instance=request.user)
        p_form = ProfileUpdateForm(instance=request.user.profile)
    context = {
        'u_form': u_form,
        'p_form': p_form
    }

    return render(request, 'users/profile.html', context)

@login_required
def user_roles(request):
    conn = connection()
    cursor = conn.cursor()
    cursor.execute('''SELECT * FROM auth_user AU
                    WHERE AU.id IN (SELECT UserID_id FROM tblUserRights)''')
    users = cursor.fetchall()
    context = {
        'users':users,
        'title': "User Roles"
    }
    return render(request, 'users/user_roles.html', context)

@login_required
def add_user_roles(request):
    conn = connection()
    cursor = conn.cursor()
    main_menu = models.tblObjectHead.objects.filter(ParentID = 0).all()
    cursor.execute('''SELECT * FROM auth_user AU
                    WHERE AU.id NOT IN (SELECT UserID_id FROM tblUserRights)''')
    users = cursor.fetchall()
    main_object_id = request.POST.get("main_object_id")
    if main_object_id:
        sub_menu = models.tblObjectHead.objects.filter(ParentID = main_object_id).all()
        sub_menu = serializers.serialize('json',sub_menu)
        return JsonResponse({"sub_menu":sub_menu})
    sub_menu_id = request.POST.get("sub_menu_id")
    print(sub_menu_id)
    if sub_menu_id:
        cursor.execute('''select OD.ObjectID, OD.ActionID, AC.ActionName
                        from tblObjectDetail OD
                        inner join tblAction AC on AC.ActionID = OD.ActionID
                        where OD.ObjectID = %s;''',[sub_menu_id])
        actions = cursor.fetchall()
        return JsonResponse({'actions':actions})
    if request.method == "POST":
        new_roles = json.loads(request.POST.get("new_roles"))
        for role in new_roles:
            userID = User.objects.filter(id = role["userID"]).first()
            role = models.tblUserRights(UserID = userID, ObjectID = role["objectID"], ActionID = role["actionID"], IsAllow = role["isAllow"])
            role.save()
    context = {
        'main_menu':main_menu,
        'users':users,
        'title':'User Roles New'
        }
    return render(request, 'users/add_user_roles.html',context)

@login_required
def edit_user_roles(request, id):
    conn = connection()
    cursor = conn.cursor()
    user = User.objects.filter(id = id).first()
    main_menu = models.tblObjectHead.objects.filter(ParentID = 0).all()
    main_object_id = request.POST.get("main_object_id")
    if main_object_id:
        sub_menu = models.tblObjectHead.objects.filter(ParentID = main_object_id).all()
        sub_menu = serializers.serialize('json',sub_menu)
        print(type(sub_menu))
        return JsonResponse({"sub_menu":sub_menu})
    sub_menu_id = request.POST.get("sub_menu_id")
    if sub_menu_id:
        cursor.execute('''select AC.ActionName, UR.IsAllow,AC.ActionID,UR.id
                        from tblUserRights UR
                        inner join tblAction AC on AC.ActionID = UR.ActionID
                        where UR.UserID_id = %s and UR.ObjectID = %s''', [user.id,sub_menu_id])
        actions = cursor.fetchall()
        return JsonResponse({'actions':actions})
    if request.method == "POST":
        edit_roles = json.loads(request.POST.get("edit_roles"))
        for value in edit_roles:
            rights = tblUserRights.objects.get(id = value["userRightID"])
            rights.IsAllow = value["isAllow"]
            rights.save()
        return JsonResponse({"succss":"success"})
    context = {
        "user":user,
        "main_menu":main_menu,
    }
    return render(request, 'users/edit_user_roles.html', context)
