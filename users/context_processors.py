from django.http import request
from .models import tblObjectHead
from django.contrib.auth.models import User
import mysql.connector

def side_bar_objects(request):
    conn = mysql.connector.connect(user='admin', host='localhost', port='3306', password='Gre@ter834', database="Indus", auth_plugin='mysql_native_password')
    ObjectHead = tblObjectHead.objects.filter(ParentID = 0).all()
    cursor = conn.cursor()
    cursor.execute('''Select * from tblObjectHead Where ObjectID in
                    (
                    Select ObjectID From tblUserRights Where UserID_id = %s AND ActionID = 1 AND isAllow = 1)
                    ''',[request.user.id])
    ObjectHeadChild = cursor.fetchall()
    return {'ObjectHead':ObjectHead,'ObjectHeadChild':ObjectHeadChild}
