from django.db import models
from PIL import Image
from django.db import models
from datetime import datetime
from django.contrib.auth.models import User
# Create your models here.

class Profile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    image = models.ImageField(default='default.jpg', upload_to='profile_pics')

    def __str__(self):
        return f'{self.user.username} Profile'

    def save(self):
        super().save()

        img = Image.open(self.image.path)
        if img.height > 300 or img.width > 300:
            output_size = (300,300)
            img.thumbnail(output_size)
            img.save(self.image.path)

class tblObjectHead(models.Model):
    ObjectID = models.AutoField(primary_key = True)
    ObjectTitle = models.CharField(max_length = 200)
    ObjectName = models.CharField(max_length = 200)
    ParentID = models.IntegerField()
    IsActive = models.BooleanField(default = True)
    ObjectCategory = models.CharField(max_length = 200)
    SerialNo = models.IntegerField()
    Icons = models.CharField(max_length = 200)

    class Meta:
        db_table = 'tblObjectHead'

class tblAction(models.Model):
    ActionID = models.AutoField(primary_key = True)
    ActionName = models.CharField(max_length = 200)

    class Meta:
        db_table = 'tblAction'


class tblObjectDetail(models.Model):
    ObjectID = models.IntegerField()
    ActionID = models.IntegerField()

    class Meta:
        db_table = 'tblObjectDetail'

class tblUserRights(models.Model):
    UserID = models.ForeignKey(User, on_delete = models.CASCADE)
    ObjectID = models.IntegerField()
    ActionID = models.IntegerField()
    IsAllow = models.BooleanField(default = True)

    class Meta:
        db_table = 'tblUserRights'

class tblCompany(models.Model):
    CompanyID = models.AutoField(primary_key = True)
    CompanyPin = models.CharField(max_length = 200)
    CompanyName = models.CharField(max_length = 200)
    Address = models.CharField(max_length = 200)
    PhoneNo = models.CharField(max_length = 200)
    EmailAddress = models.CharField(max_length = 200)
    Website = models.CharField(max_length = 200)
    Image = models.ImageField(default='default.jpg', upload_to='company_pic')

    class Meta:
        db_table = 'tblCompany'


class tblTransactionLog(models.Model):
    TranID = models.AutoField(primary_key = True)
    ObjectID = models.IntegerField()
    UserID = models.IntegerField()
    AccessDateTime = models.DateTimeField(default=datetime.now, blank=True)
    SystemName = models.CharField(max_length = 200)
    ActionID = models.IntegerField()
    Description = models.TextField()

    class Meta:
        db_table = 'tblTransactionLog'