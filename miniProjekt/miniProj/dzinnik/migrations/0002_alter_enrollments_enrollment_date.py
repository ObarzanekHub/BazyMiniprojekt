# Generated by Django 4.2.2 on 2023-06-14 02:08

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('dzinnik', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='enrollments',
            name='enrollment_date',
            field=models.DateTimeField(auto_now_add=True),
        ),
    ]