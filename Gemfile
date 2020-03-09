source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'bootstrap'
gem 'coffee-rails', '~> 4.2'
gem 'faker'
gem 'figaro'
gem 'font-awesome-sass'
gem 'html2slim'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'kaminari'
gem 'mysql2', '>= 0.4.4', '< 0.6.0'
gem 'puma', '~> 3.11'
gem 'rails', '~> 5.2.4', '>= 5.2.4.1'
gem 'ransack'
gem 'sass-rails', '~> 5.0'
gem 'slim-rails'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

# gem 'mini_racer'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'capistrano'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
  gem 'factory_bot_rails', '~> 4.11'
  gem 'rubocop'
  gem 'rubocop-rails'
end

group :production, :staging do
  gem 'unicorn'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'chromedriver-helper'
  gem 'rspec-rails', '~> 3.7'
  gem 'rspec_junit_formatter'
  gem 'selenium-webdriver'
end

gem 'tzinfo-data'
