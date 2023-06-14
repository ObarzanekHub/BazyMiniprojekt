from django.urls import path

from . import views

urlpatterns = [
    path("", views.index, name="index"),
    path("add_subject/", views.add_subject, name="add_subject"),
    path("enroll_to_subject/", views.enroll_to_subject, name="enroll_to_subject"),
]

