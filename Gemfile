source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.5'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

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

gem 'pg'
gem "kaminari"
gem 'thin'
gem 'state_machine'

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

# Use Capistrano for deployment
group :development do
  gem "parallel_tests"
  gem 'railroady'
  gem 'capistrano'
  gem 'capistrano-rails', '~> 1.1.0'
  gem 'capistrano-bundler'
  gem 'capistrano-rbenv', github: "capistrano/rbenv"
  gem "brakeman", :require => false
  gem "hirb"
  gem "letter_opener"
end

group :development, :test do
  gem 'delorean'
  gem "faker"
  gem "factory_girl_rails"
  gem "quiet_assets"
  gem 'pry'
  gem 'pry-doc'
  gem 'pry-rails'
  #gem 'pry-debugger'
  gem "spork"
  gem "better_errors"
  gem "binding_of_caller"
  gem 'rspec-rails' # Needed for rake stats to calculate test coverage
  gem "awesome_print"
end

group :it, :staging, :development, :test, :uat, :production do
  gem 'ruby-progressbar'
  gem "colorize"
  gem "capistrano-sidekiq"
end
