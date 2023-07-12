from cgitb import text
from io import open_code
from flask import Flask, request, render_template, redirect, session
import random
import pymongo


app = Flask(__name__)
list = ['张三','李四','小王','小雪','老王','王五','小白','阿斌','刘涛','小明','小华']
lis= ['张三','老王','王五','小白','阿斌','刘涛','小明','小华','李四','小王','小雪','小白','阿斌','刘涛','小明']

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/user', methods=['POST'])
def user():
    jg1 = random.choice(list)
    jg2 = random.choice(list)
    jg3 = random.choice(lis)
    return render_template('user.html', jg1=jg1, jg2=jg2, jg3=jg3)

@app.route('/users', methods=['POST'])
def users():
    geter = request.form['geter']
    geter = str(geter)
    list.append(geter)
    return render_template('index.html', text="添加成功")


if __name__ == '__main__':
    app.run(port=5001, debug=True)