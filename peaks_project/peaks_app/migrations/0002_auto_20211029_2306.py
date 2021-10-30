# Generated by Django 3.1.13 on 2021-10-29 23:06

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('peaks_app', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='WhiteList',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('remote_addr', models.GenericIPAddressField(blank=True, null=True, verbose_name='remote address')),
                ('country', models.CharField(max_length=200)),
            ],
        ),
        migrations.DeleteModel(
            name='Location',
        ),
    ]