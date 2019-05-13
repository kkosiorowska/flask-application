# flask-application

## Database

How to create  db.sqlite file 

sqlite3 db.sqlite < schema.sql

## REST API

### Select example

* [movies](http://127.0.0.1:5000/movies) - Get all movies
* [users](http://127.0.0.1:5000/users) - Get all users
* [seans](http://127.0.0.1:5000/seans) - Get all seans
* [groups](http://127.0.0.1:5000/groups) - Get all groups
* [participants](http://127.0.0.1:5000/participants) - Get all participants

### Insert example

* Add new group

curl -X POST -H "Content-Type: application/json" -d '{
    "seansId": "2"
}' http://localhost:5000/groups

* Add new person to group

curl -X POST -H "Content-Type: application/json" -d '{
    "groupsId": "1",
    "usersId": "3"
}' http://localhost:5000/participants

### Update example

curl -X POST -H "Content-Type: application/json" -d '{
    "groupsId": "1",
    "usersId": "1",
    "active": "0"
}' http://localhost:5000/deleteParticipant

