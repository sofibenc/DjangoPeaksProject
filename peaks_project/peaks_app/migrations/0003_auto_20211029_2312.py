# Generated by Django 3.1.13 on 2021-10-29 23:12

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('peaks_app', '0002_auto_20211029_2306'),
    ]

    operations = [
        migrations.RenameModel(
            old_name='WhiteList',
            new_name='RejectedConnections',
        ),
    ]