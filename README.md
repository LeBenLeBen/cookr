# Cookr

Cookr is a simple Rails application to manage cooking recipes organized by tags.

## Installation

### Virtualization with [Drifter](https://github.com/liip/drifter)

Vagrant and Virtualbox or Vagrant-LXS are required. Check [Drifter documentation](https://liip-drifter.readthedocs.io/en/stable/) if necessary.

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

Go to [cookr.lo](http://cookr.lo).

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

```ruby
User.create(email: '', password: '', password_confirmation: '')
```

## Enable search

The search work through [Algolia](https://www.algolia.com/). To enable it you need to:
- Have an Algolia account
- If the `.env` file doesn’t already exists, copy `.env.example` to `.env`
- Fill in the variables `ALGOLIASEARCH_APPLICATION_ID`, `ALGOLIASEARCH_API_KEY` and `ALGOLIASEARCH_API_KEY_SEARCH` according to the values you’ll find in your Algolia dashboard
- Index data with `rake algoliasearch:reindex`

Note: indexing will automatically create new Algolia indices in the form `Model_environment`, for example `Recipe_development`.

## License

Cookr is licensed under [GPL version 3](http://www.gnu.org/copyleft/gpl.html).
