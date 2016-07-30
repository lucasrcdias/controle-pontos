source 'https://rubygems.org'
ruby '2.3.0'

# Duh
gem 'rails', '4.2.5'

# Database
gem 'pg', '~> 0.18.3'

# html, css, compressor
gem 'slim',               '~> 2.0.3'
gem 'uglifier',           '>= 1.3.0'
gem 'sass-rails',         '~> 5.0.1'
gem 'font-awesome-rails', '~> 4.4.0.0'

# I18n
gem 'rails-i18n', '~> 4.0.5'

# Settings and log
gem 'settingslogic', '~> 2.0.9'
gem 'lograge',       '~> 0.3.4'

# Authentication
gem 'devise', '~> 3.5.2'

# Form
gem 'simple_form', '~> 3.1.1'

# Enumeration
gem 'enumerate_it', '~> 1.2.8'

# Controllers
gem 'responders',      '~> 2.1.0'
gem 'decent_exposure', '~> 2.3.2'

#API
gem 'active_model_serializers', '~> 0.10.0'
gem 'rack-cors', :require => 'rack/cors'

# JSON Web Token
gem 'jwt', '~> 1.5', '>= 1.5.4'

#CPF/CNPJ
gem 'brcpfcnpj', '~> 3.3'

#Search and pagination
gem 'ransack',  '~> 1.7'
gem 'kaminari', '~> 0.16.3'

# Server
gem 'puma', '~> 2.15.3'

group :development do
  gem 'letter_opener',      '~> 1.4.1'
  gem 'better_errors',      '~> 2.1.1'
  gem 'binding_of_caller',  '~> 0.7.2'
  gem 'capistrano',         '2.15.6'
end

group :test do
  gem 'capybara',         '~> 2.5.0'
  gem 'database_rewinder'
  gem 'simplecov',        '~> 0.10.0', require: false
end

group :development, :test do
  gem 'ffaker',             '~> 2.1'
  gem 'rspec-rails',        '~> 3.3.3'
  gem 'shoulda-matchers',   '~> 2.8.0', require: false
  gem 'factory_girl_rails', '~> 4.5.0'
  gem 'pry-rails',          '~> 0.3.4'
  gem 'pry-remote',         '~> 0.1.8'
  gem 'railroady'
end

gem 'rails_12factor', group: :production
