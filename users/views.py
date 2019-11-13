from django.shortcuts import render, redirect
from django.contrib import messages
from .forms import UserRegisterForm
from django.contrib.auth.views import LoginView

# Create your views here.
def register(request):
    if request.method == "POST":
        form = UserRegisterForm(request.POST)
        if form.is_valid():
            form.save()
            # username = form.cleaned_data.get('username')
            messages.success(request, f'Your Account has been created! now you can login to your account')
            return redirect('Login')
    else:
        form = UserRegisterForm()

    return render(request,'users/register.html',{'form':form, 'title':'Register'})
