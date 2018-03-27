source 'https://rubygems.org'
ruby '2.4.1'

gem 'rails', '~> 5.1'
gem 'responders'

gem 'pg'

gem 'devise'
gem 'devise_invitable', '~> 1.7.0'
gem 'paperclip'
gem 'aws-sdk', '~> 2.3.0'
gem 'sprockets'
gem 'rinku'
gem 'foreman'
gem "administrate"
gem 'cancancan', '~> 2.0'
gem 'simple_form'

gem 'webpacker', '~> 3.2'
gem 'active_link_to'
gem 'vanilla-ujs', :github => 'hauleth/vanilla-ujs'

# Optimized for Heroku
group :production do
  gem 'unicorn'
  gem 'newrelic_rpm'
  gem 'rails_12factor' # Heroku gem to avoid plugins injection
end

group :development do
  gem 'rb-fsevent'
  gem 'guard-livereload'
  gem 'letter_opener'
  gem 'web-console'
end
