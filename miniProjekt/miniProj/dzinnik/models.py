from django.db import models

# Create your models here.

class Teachers(models.Model):
    name=models.CharField(max_length=50)
    lastname=models.CharField(max_length=50)
    birthdate=models.DateTimeField()
    email=models.EmailField()

    def __str__(self):
        return self.name+" "+self.lastname


class Classses(models.Model):
    class_name=models.CharField(max_length=10)
    start_year=models.IntegerField()
    end_year=models.IntegerField()
    class_supervisor=models.ForeignKey(Teachers,on_delete=models.CASCADE)


class Students(models.Model):
    name=models.CharField(max_length=50)
    lastname=models.CharField(max_length=50)
    birth_date=models.DateTimeField()
    classes=models.ForeignKey(Classses,on_delete=models.CASCADE)

    def __str__(self):
        return self.name+" "+self.lastname


class Subjects(models.Model):
    subject_name=models.CharField(max_length=50)
    teacher=models.ForeignKey(Teachers,on_delete=models.CASCADE)
    max_capacity=models.IntegerField()

    def __str__(self):
        return self.subject_name


class Enrollments(models.Model):
    student=models.ForeignKey(Students,on_delete=models.CASCADE)
    subject=models.ForeignKey(Subjects,on_delete=models.CASCADE)
    enrollment_date=models.DateTimeField(auto_now_add=True)
