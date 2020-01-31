ruby '2.7.0'

# Auth
gem 'cancancan'

# Core
gem 'bootsnap', '>= 1.1.0', require: false
gem 'pg'
gem 'puma', '~> 3.11'
gem 'rails', '~> 5.2.3'

# Storage
gem 'carrierwave', '~> 2.0'
gem 'fog-core', '2.1.0'
gem 'fog-google'
gem 'google-cloud-storage', '~> 1.11', require: false
gem 'hiredis'
gem 'redis'

# Tools
gem 'acts_as_list'
gem 'bcrypt', '~> 3.1', '>= 3.1.13'
gem 'figaro'
gem 'interactor', '~> 3.1', '>= 3.1.2'
gem 'interactor-rails', '~> 2.2', '>= 2.2.1'
gem 'jwt'
gem 'rack-cors'

group :development, :test do
  gem 'factory_bot_rails'
  gem 'fasterer'
  gem 'ffaker'
  gem 'pry'
  gem 'rspec-rails'
  gem 'rubocop'
  gem 'rubocop-rails'
  gem 'rubocop-rspec'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'database_cleaner'
  gem 'dox', require: false
  gem 'json_matchers', '~> 0.11.1'
  gem 'shoulda-matchers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
