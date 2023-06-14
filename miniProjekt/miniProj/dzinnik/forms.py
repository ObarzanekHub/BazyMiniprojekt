from django import forms
from .models import Subjects,Enrollments

class AddSubjectForm(forms.ModelForm):
    class Meta:
        model=Subjects
        fields=['subject_name','teacher','max_capacity']
        labels={'subject_name':'Nazwa przedmiotu','teacher':'Nauczyciel','max_capacity':'Maksymalna ilość'}


class EnrollToSubject(forms.ModelForm):
    class Meta:
        model=Enrollments
        fields=['student','subject']
        labels={'student':'Uczeń','subject':'Przedmiot'}