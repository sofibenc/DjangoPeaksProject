# Generated by Django 3.1.13 on 2021-10-29 23:14

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('peaks_app', '0003_auto_20211029_2312'),
    ]

    operations = [
        migrations.RenameModel(
            old_name='RejectedConnections',
            new_name='RejectedConnection',
        ),
    ]