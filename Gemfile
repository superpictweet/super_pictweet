source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.5'
gem 'mysql2', '>= 0.3.18', '< 0.5'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'devise'
gem 'omniauth-facebook'
gem 'carrierwave'
gem 'mini_magick'
gem 'pundit'
gem "acts_as_follower", github: "tcocca/acts_as_follower"
gem 'acts-as-taggable-on', github: 'mbleigh/acts-as-taggable-on', branch: 'master'
gem 'ransack'
gem 'friendly_id', '~> 5.1.0'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'pry-rails'
  gem 'rubocop'
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'database_cleaner'
  gem 'faker'
  gem 'rails-controller-testing'
  gem 'simplecov'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'spring-commands-rspec'
end

group :test do
  gem 'pundit-matchers', '~> 1.4.1'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'semantic-ui-sass'
gem 'jquery-rails'
gem "react_on_rails", "10.0.0"
gem "webpacker", "~> 3.0"

gem 'mini_racer', platforms: :ruby
