[![Build Status](https://travis-ci.org/cjm106/acebook-the-fat-controllers-backend.svg?branch=master)](https://travis-ci.org/github/cjm106/acebook-the-fat-controllers-backend)

# AceBook-the-fat-controllers-backend

Rails API backend for https://github.com/AndrewHulme/acebook-the-fat-controllers

## Technologies used

* Rails
* PostgreSQL
* Simple Command gem
* Bcrypt gem
* Rack-cors gem
* JWT gem

## How to Install and Run

- Clone/fork repo
- run 'bundle install'
...

## How to Run Tests

- Run ... in the project directory

## Learning Processes

Go to the Github wiki to see our learning processes:
https://github.com/AndrewHulme/acebook-the-fat-controllers/wiki



##  API Examples

```
## Signup

curl -H "Content-Type: application/json" -X POST -d '{"user": {"email":"email","username":"username","name":"name","password":"12345","password_confirmation":"12345"}}' http://localhost:3000/signup

# example responses:
$ {"username":"username","created_at":"2020-06-07T15:56:58.721Z"}
$ {"email":["has already been taken"],"username":["has already been taken"]}
$ {"password":["can't be blank"]}

## Login

curl -H "Content-Type: application/json" -X POST -d '{"username":"username","password":"12345"}' http://localhost:3000/login

#example responses:
$ {"auth_token":"eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo0LCJleHAiOjE1OTE5ODIwNjZ9.LIBn8pczWfLA_WCyNbuiw0qWUdj3i2OHVE4JSV2dDkQ","username":"username"}
$ {"error":{"user_authentication":"invalid credentials"}}

## Posts

curl http://localhost:3000/posts

#example response:
{"id":1,"user_id":1,"message":"hello, world!","created_at":"2020-06-09T16:09:03.620Z","user":{"username":"freestar92"}},{"id":2,"user_id":2,"message":"hello, mum!","created_at":"2020-06-09T16:18:32.973Z","user":{"username":"swiftactor29"}}]


## New Post

curl -H "Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo0LCJleHAiOjE1OTE5ODIwNjZ9.LIBn8pczWfLA_WCyNbuiw0qWUdj3i2OHVE4JSV2dDkQ" -H "Content-Type: application/json" -H "Accept: application/json" -X POST -d '{"post":{"message":"hello, world!"}}' http://localhost:3000/new

# example responses:
$ {"id":7,"user_id":4,"message":"hello, world!","created_at":"2020-06-11T17:16:37.800Z","updated_at":"2020-06-11T17:16:37.800Z","user":{"username":"username"}}
$ {"error":"Not Authorized"}

## Delete Post

curl -H "Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyLCJleHAiOjE1OTE4OTgyMTh9.yqwJGbaMazOcDt2nprshe0nAkCGaIVv-hPfk3y6fNvk" -H : application/json" -H "Accept: application/json" -X PATCH -d '{"id":1}' http://localhost:3000/delete

# example responses:
$ "unauthorized"
$ "deleted"

## Edit Post

curl -H "Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyLCJleHAiOjE1OTE4OTgyMTh9.yqwJGbaMazOcDt2nprshe0nAkCGaIVv-hPfk3y6fNvk" -H "Content-Type: application/json" -H "Accept: application/json" -X PATCH -d '{"id":6, "post":{"message":"its my birthday!"}}' http://localhost:3000/edit

# example responses:

$ "unauthorized"
$ {"user_id":3,"id":6,"message":"its my birthday!","created_at":"2020-06-12T10:52:12.115Z","updated_at":"2020-06-12T11:08:38.545Z","user":{"username":"username"}}


```


## Quickstart

First, clone this repository. Then:

```bash
> bundle install
> rake db:create
> rake db:migrate

> rspec # Run the tests to ensure it works
> rails server # Start the server at localhost:3000
```
