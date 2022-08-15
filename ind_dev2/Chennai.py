import json
from flask import Flask
app = Flask(__name__)



@app.route('/students')
def home():
    with open('/home/akshat/Desktop/ind_dev2/data/Chennai/students.json', 'r') as myfile:
       data = myfile.read()
       return '{}    {}'.format(data,'server--> http://127.0.0.1:8000/ ')

@app.route('/faculty')
def home1():
   with open('/home/akshat/Desktop/ind_dev2/data/Chennai/faculty.json', 'r') as myfile1:
      data1 = myfile1.read()
      return '{}    {}'.format(data1, 'server--> http://127.0.0.1:8000/ ')
    
if __name__ == '__main__':
    app.run()
