source 'https://rubygems.org'
ruby '2.1.2'

gem 'rails', '4.1.8'

gem 'devise'
gem 'paperclip'
gem 'aws-sdk'
gem 'sprockets', '2.11.0' # Avoid error with stylesheet_link_tag in 2.12
gem 'rinku'

gem 'sass-rails', '~> 5.0.1'
gem 'compass-rails'
gem 'compass-flexbox'
gem 'bootstrap-sass', '~> 3.0.3'
gem 'font-awesome-sass', '~> 4.2.0'

gem 'handlebars_assets'

gem 'uglifier', '>= 1.0.3'

# Optimized for Heroku
group :production do
  gem "pg" # PostgreSQL
  gem "rails_12factor" # Heroku gem to avoid plugins injection
end

group :development do
  gem 'rb-fsevent'
  gem 'guard-livereload'
  gem 'sqlite3'
  gem 'letter_opener'
end

gem 'jquery-rails'
