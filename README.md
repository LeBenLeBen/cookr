Cookr
=====

Cookr is a simple Rails application to manage cooking recipes organized by tags.

*It is an experimental project and a work in progress. But it works!*

A live demo is available at http://cookr.herokuapp.com/. It is hosted on a Heroku free plan, it might take up to 30 seconds to start. Be patient.


Installation
------------

Note: Ruby >= 2.1 and [Bundler](http://bundler.io/) are required.

Clone the repository and enter the project folder:

```
git clone git@github.com:LeBenLeBen/cookr.git && cd cookr
```

Install dependencies with Bundler:

```
bundle install
```

Copy the database configuration file (by default it use SQLite locally and Postgres on production as required by Heroku):

```
cp config/database.example.yml config/database.yml
```

Setup the database:

```
rake db:migrate
```

Create a user
-------------

Registration are disabled. You can use the console (`rails c`) to create a new user.

```
User.create(:email => '', :password => '', :password_confirmation => '')
```

License
-------

Cookr is licensed under GPL version 3.