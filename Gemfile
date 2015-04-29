source 'https://rubygems.org'
ruby '2.2.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'
# Use sqlite3 as the database for Active Record
# gem 'sqlite3'
gem 'mysql2', group: [:development, :test]
gem 'pg', group: :production
gem 'rails_12factor', group: :production
# Use SCSS for stylesheets
# gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
gem 'unicorn'

# Use Capistrano for deployment
group :development do
  gem 'capistrano-rails'
  gem 'capistrano-rvm'
end

# Use debugger
# gem 'debugger', group: [:development, :test]

gem 'authenticatable', git: 'https://github.com/vmcilwain/authenticatable'

gem 'bootstrap-sass', '~> 3.3.1'
gem 'autoprefixer-rails'
gem "haml-rails"
gem "puma"
gem 'jquery-turbolinks'
gem "ransack"
gem 'twitter'
gem 'paperclip'
gem 'aws-sdk', '< 2.0'
gem 'httparty'
gem 'remotipart', '~> 1.2'
gem 'will_paginate', '~> 3.0.6'
gem 'letter_opener', group: [:development]
gem "font-awesome-rails"

group :test do
  gem "rspec-rails"
  gem "rails-erd"
  gem "simplecov"
  gem "shoulda-matchers"
  gem "fabrication"
  gem "database_cleaner"
  gem "capybara"
  gem "vcr"
  gem "webmock"
  gem 'selenium-webdriver'
end

group :development, :test do
  gem "faker"
  gem "pry"
  gem "pry-nav"
  gem "better_errors"
  gem "yard"
end
