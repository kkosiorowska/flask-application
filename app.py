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


if __name__ == '__main__':
    app.run(debug=True)