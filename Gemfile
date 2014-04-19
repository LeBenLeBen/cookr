source 'https://rubygems.org'
ruby '2.0.0'

gem 'rails', '3.2.12'

gem 'devise'
gem 'paperclip'
gem 'aws-sdk'

# Optimized for Heroku
group :production do
  gem "pg" # PostgreSQL
  gem "rails_12factor" # Heroku gem to avoid plugins injection
end

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'compass-rails'
  gem 'compass-flexbox'
  gem 'bootstrap-sass', '~> 3.0.1.0.rc'
  gem 'font-awesome-sass'

  gem 'handlebars_assets'

  gem 'rb-fsevent'
  gem 'guard-livereload'

  gem 'uglifier', '>= 1.0.3'
end

group :development do
  gem 'rb-fsevent'
  gem 'guard-livereload'
  gem 'sqlite3'
  gem 'letter_opener'
end

gem 'jquery-rails'
