# Generated by Django 2.2 on 2019-11-13 05:09

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('construction', '0002_voucherheader_accountid'),
    ]

    operations = [
        migrations.CreateModel(
            name='CompanyInfo',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('companyName', models.CharField(max_length=100)),
                ('companyAddress', models.TextField()),
                ('companyLogo', models.ImageField(default='default.jpg', upload_to='company_logo')),
                ('phoneNo', models.CharField(max_length=100)),
                ('mobileNo', models.CharField(max_length=100)),
                ('email', models.CharField(max_length=100)),
                ('website', models.CharField(max_length=100)),
            ],
        ),
    ]
