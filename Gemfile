source 'https://rubygems.org'

gem 'rails', '3.2.8'
gem 'sqlite3'
gem 'jquery-rails'
gem "haml", ">= 3.1.7"
gem "devise"

group :development do
  gem "haml-rails", ">= 0.3.5"
  gem "hpricot", ">= 0.8.6"
  gem "ruby_parser", ">= 2.3.1"
  gem "quiet_assets", ">= 1.0.1"
  gem "hub", ">= 1.10.2", require: nil
end

group :development, :test do
  gem "capybara"
  gem 'capybara-webkit'
  gem 'launchy'
  gem "email_spec", ">= 1.2.1"
  gem "database_cleaner"
  gem 'rspec', ">= 2.5.0"
  gem 'rspec-rails', ">= 2.11.0"
  gem 'factory_girl_rails', ">= 4.0.0"
  gem 'spork'
  gem 'guard-spork'
  gem 'turn', :require => false
  gem 'shoulda-matchers'
  gem 'debugger'
end

group :production do
  gem 'thin'
  gem 'pg'
end

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem "twitter-bootstrap-rails", ">= 2.1.3"
  gem "therubyracer", ">= 0.10.2", platform: :ruby
end
