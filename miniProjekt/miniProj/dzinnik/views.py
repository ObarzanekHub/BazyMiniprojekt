from django.http import HttpResponse
from .models import Subjects
from django.template import loader
from .forms import AddSubjectForm,EnrollToSubject
from django.contrib.auth.decorators import login_required
from django.http import Http404, HttpResponseRedirect
from django.shortcuts import render, redirect, get_object_or_404


def index(request):
    subjects_list=Subjects.objects.all()
    template=loader.get_template("dzinnik/index.html")
    context={
        "subjects_list": subjects_list
    }
    return HttpResponse(template.render(context,request))


def add_subject(request):
    if request.method!='POST':
        form=AddSubjectForm()
    else:
        form=AddSubjectForm(data=request.POST)
        if form.is_valid():
            new_subject=form.save(commit=True)
            new_subject.save()
            return redirect('index')
    context={'form':form}
    return render(request,'dzinnik/add_subject.html',context)




def enroll_to_subject(request):
    if request.method!='POST':
        form=EnrollToSubject()
    else:
        form=EnrollToSubject(data=request.POST)
        if form.is_valid():
            new_enrollment=form.save(commit=True)
            new_enrollment.save()
            return redirect('index')
    context={'form':form}
    return render(request,'dzinnik/enroll_to_subject.html',context)


