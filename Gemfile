source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.1'
# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

# .slim

gem 'slim-rails'
gem 'html2slim', group: :development

# bootstraip sass

gem 'bootstrap-sass'
gem 'autoprefixer-rails'

gem 'bootstrap_form'

## App server系

gem 'foreman'
gem 'puma'

## 開発系

gem 'awesome_print'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'rails-footnotes', '>= 4.0.0', '<5'
end

group :development do
  gem 'letter_opener'
  gem 'quiet_assets'
  gem 'view_source_map'
end

## 認証

# https://github.com/plataformatec/devise#getting-started
gem 'devise'
# deviseのビューとかコントローラーを変更する場合はこちらを参考に。
# https://github.com/plataformatec/devise#configuring-views
# https://github.com/plataformatec/devise#configuring-controllers
# 例)
# $ rails generate devise:views users
# $ rails generate devise:controllers users
# 生成ビューはerb2slimでslim化可能

## テスト系
group :development, :test do
  gem 'rspec-rails'

  # http://www.rubydoc.info/gems/factory_girl/file/GETTING_STARTED.md
  gem 'factory_girl_rails'

  # https://github.com/stympy/faker
  gem 'faker'


  # http://techracho.bpsinc.jp/hachi8833/2014_05_28/17557
  gem 'database_cleaner'

  gem 'spring-commands-rspec'
end

# http://makandracards.com/konjoot/20749-rspec-+-capybara-+-rails4-+-spork-intergation-tests-setup-with-selenium-and-poltergeist
# http://blog.livedoor.jp/sasata299/archives/51924944.html
group :test do
  gem 'capybara'
  gem 'launchy'

  # $ brew phantomjs すること
  gem 'poltergeist'

  # https://github.com/jnicklas/turnip
  gem 'turnip'
end

group :development do
  gem 'guard-rspec', require: false
  gem 'guard-livereload', require: false
  gem 'ffi'
end

# ページネーション
# http://ruby-journal.com/how-to-style-kaminari-pagination-with-twitter-bootstrap-3/
# rails generate kaminari:views bootstrap3
gem 'kaminari'
