# Generated by Django 3.1.13 on 2021-10-30 21:29

from django.db import migrations, models
import django_admin_geomap


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Peak',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=200)),
                ('lat', models.FloatField()),
                ('lon', models.FloatField()),
                ('altitude', models.FloatField()),
            ],
            bases=(models.Model, django_admin_geomap.GeoItem),
        ),
        migrations.CreateModel(
            name='RejectedConnection',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('remote_addr', models.GenericIPAddressField(blank=True, null=True, verbose_name='remote address')),
                ('country', models.CharField(max_length=200)),
                ('pub_date', models.DateTimeField(auto_now_add=True)),
            ],
        ),
        migrations.CreateModel(
            name='WhitelistCountry',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('country', models.CharField(max_length=200)),
            ],
            options={
                'verbose_name_plural': 'WhitelistCountries',
            },
        ),
    ]
