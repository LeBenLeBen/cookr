# Cookr

Cookr is a simple Rails application to manage cooking recipes organized by tags.

## Installation

### Virtualization with [Drifter](https://github.com/liip/drifter)

Vagrant and Virtualbox or Vagrant-LXS are required. Check Drifter documentation if necessary.

```bash
git clone --recursive git@github.com:LeBenLeBen/cookr.git
cd cookr
vagrant up
```

Wait for the provisioning to complete, then enter the box and start the server.

```bash
vagrant ssh
bundle exec foreman start
```

Go to [cookr.lo:5000](http://cookr.lo:5000).

### Local installation

Ruby >= 2.4, PostgreSQL and [Bundler](http://bundler.io/) are required.

```bash
git clone git@github.com:LeBenLeBen/cookr.git
cd cookr
bundle install
```

#### Setup database

Create the PostgreSQL user (default password is _cookr_):

```bash
createuser cookr -P
```

Create the PostgreSQL database:

```bash
createdb cookr
```

Copy the database configuration file (PostgreSQL):

```bash
cp config/database.example.yml config/database.yml
```

Update it to match your settings, then load the schema into the database:

```bash
rails db:migrate
```

#### Start the server

```bash
bundle exec foreman start
```

Go to [localhost:5000](http://localhost:5000).

## Create a user

Registrations are disabled. You can use the console (`rails c`) to create a new user.

```
User.create(:email => '', :password => '', :password_confirmation => '')
```

## License

Cookr is licensed under [GPL version 3](http://www.gnu.org/copyleft/gpl.html).
