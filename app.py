from flask import Flask
import sqlite3
import json


app = Flask(__name__)


def create_connection():
    con = sqlite3.connect('db.sqlite')
    con.row_factory = sqlite3.Row
    return con


@app.route('/movies', methods=['GET', 'POST'])
def movies():
    db = create_connection()
    data = db.execute('SELECT * FROM movies ORDER BY id ;')
    movies = data.fetchall()
    return json.dumps([dict(movie)for movie in movies])  # create json object


@app.route('/users', methods=['GET', 'POST'])
def users():
    db = create_connection()
    data = db.execute('SELECT * FROM users ORDER BY id ;')
    users = data.fetchall()
    return json.dumps([dict(user)for user in users])


@app.route('/seans', methods=['GET', 'POST'])
def seans():
    db = create_connection()
    data = db.execute('SELECT * FROM seans ORDER BY id ;')
    seans = data.fetchall()
    return json.dumps([dict(s)for s in seans])


@app.route('/groups', methods=['GET', 'POST'])
def groups():
    db = create_connection()
    data = db.execute('SELECT * FROM groups ORDER BY id ;')
    groups = data.fetchall()
    return json.dumps([dict(group)for group in groups])


if __name__ == '__main__':
    app.run(debug=True)