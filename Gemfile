source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails' , '4.2.1'
# Use PostgreSQL as the database for Active Record
gem "pg"
# pg_search builds ActiveRecord named scopes that take advantage of PostgreSQL's full text search
gem 'pg_search', '~> 0.7.9'

gem 'carrierwave'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# # bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# gem 'turbolinks'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use passenger as the app server
# gem 'passenger'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
gem 'devise'
gem 'cancan'

gem 'responders'
gem 'devise', '~> 3.5.0'                # Flexible authentication solution for Rails with Warden
gem 'devise_invitable', '~> 1.5.0'      # An invitation strategy for devise
gem 'devise-token_authenticatable', "~> 0.4.0" # Token Authenticatable module of devise. 

gem 'default_value_for', '3.0.1'      # Provides a way to specify default values for ActiveRecord models
gem 'will_paginate', '~> 3.0.6'       # Pagination library for Rails

gem 'simple-navigation'

group :test, :development do
  gem "webrat", "0.7.3", require: false
  gem "mocha", "~> 1.1", require: false
  gem 'quiet_assets'
  # Annotates Rails/ActiveRecord Models, routes, fixtures based on schema
  gem 'annotate'

  # Show coverage informations directly
  gem 'simplecov', require: false

  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  # gem 'spring',        group: :development
  gem "rails-erd"
end

gem 'memory_test_fix'
