Cookr
=====

Cookr is a simple Rails application to manage cooking recipes organized by tags.

*It is an experimental project and a work in progress. But it works!*

A live demo is available at [cookr.herokuapp.com](http://cookr.herokuapp.com/). It is hosted on a Heroku free plan, it might take up to 30 seconds to start. Be patient.


Installation
------------

Note: Ruby >= 2.1, PostgreSQL and [Bundler](http://bundler.io/) are required.

Clone the repository and enter the project folder:

```
git clone git@github.com:LeBenLeBen/cookr.git && cd cookr
```

Install dependencies with Bundler:

```
bundle install
```

Copy the database configuration file (PostgreSQL):

```
cp config/database.example.yml config/database.yml
```

Create the PostgreSQL user (default password is _cookr_):

```
createuser cookr -P
```

Create the PostgreSQL database:

```
createdb cookr
```

Setup the database:

```
rake db:migrate
```

Run the server with Foreman:

```
foreman start
```

Go to [localhost:5000](http://localhost:5000).

Create a user
-------------

Registrations are disabled. You can use the console (`rails c`) to create a new user.

```
User.create(:email => '', :password => '', :password_confirmation => '')
```

License
-------

Cookr is licensed under [GPL version 3](http://www.gnu.org/copyleft/gpl.html).