source 'https://rubygems.org'
ruby "2.3.1"


gem 'rails', '~> 5.0.0'
gem 'puma',  '~> 3.0'
gem 'active_model_serializers'
gem 'rack-cors'

group :development, :test do
  gem 'sqlite3'
  gem 'byebug', platform: :mri
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'dredd_hooks'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'guard-rspec',           require: false
  gem 'spring-commands-rspec', require: false
end

group :test do
  gem 'faker'
  gem 'database_cleaner'
  gem 'launchy'
end

group :production do
  gem 'pg'
end

group :development do
  gem 'listen', '~> 3.0.5'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
