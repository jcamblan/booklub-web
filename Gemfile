# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.0'

gem 'aasm' # https://github.com/aasm/aasm
gem 'activerecord_where_assoc', '~> 1.1'
gem 'bootsnap', require: false # Reduces boot times through caching; required in config/boot.rb
gem 'clearance', '~> 2.5'
gem 'counter_culture', '~> 3.1'
gem 'fabrication'
gem 'faker'
gem 'image_processing', '~> 1.12'
gem 'importmap-rails' # Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0' # Use the Puma web server [https://github.com/puma/puma]
gem 'rails', '~> 7.0.0' # Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'redis', '~> 4.0' # Use Redis adapter to run Action Cable in production
gem 'rest-client'
gem 'rubocop', '~> 1.23'
gem 'rubocop-performance', '~> 1.12'
gem 'rubocop-rails', '~> 2.12'
gem 'sidekiq', '~> 6.3'
gem 'sidekiq-scheduler', '~> 3.1'
gem 'sprockets-rails' # The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem 'stimulus-rails' # Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem 'tailwindcss-rails' # Use Tailwind CSS [https://github.com/rails/tailwindcss-rails]
gem 'turbo-rails' # Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby] # Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'view_component', '~> 2.46'

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
# gem 'jbuilder'

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Use Sass to process CSS
# gem "sassc-rails"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem 'annotate' # https://github.com/ctran/annotate_models
  gem 'hotwire-livereload'
  gem 'web-console'
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end
