source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'acts_as_list'
gem 'bcrypt', '~> 3.1', '>= 3.1.13'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'cancancan'
gem 'carrierwave', '~> 2.0'
gem 'fasterer'
gem 'figaro'
gem 'fog-core', '2.1.0'
gem 'fog-google'
gem 'google-cloud-storage', '~> 1.11', require: false
gem 'jwt'
gem 'mini_magick', '~> 4.8'
gem 'pg'
gem 'puma', '~> 3.11'
gem 'rack-cors'
gem 'rails', '~> 5.2.3'

group :development, :test do
  gem 'factory_bot_rails'
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
  gem 'shoulda-matchers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
