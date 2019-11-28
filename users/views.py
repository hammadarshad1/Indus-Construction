from django.shortcuts import render, redirect
from django.contrib import messages
from .forms import (UserRegisterForm, UserUpdateForm, ProfileUpdateForm)
from django.contrib.auth.views import LoginView
from django.contrib.auth.models import User
from django.contrib.auth.decorators import login_required, user_passes_test
from . import models

# Create your views here.

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