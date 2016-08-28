source 'https://rubygems.org'

#############################################################
# default
#############################################################

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.4'
# Use postgres as the database for Active Record
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
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
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

gem 'therubyracer'
gem 'less-rails' #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

#############################################################
# my gems
#############################################################

gem 'haml-rails', '~> 0.9'
gem 'twitter-bootstrap-rails'
gem 'select2-rails'
gem 'cocoon'

gem 'rails-i18n', '~> 4.0.0'

gem 'awesome_nested_set'

# gem 'colorize'

gem 'org-ruby'

gem 'linkeddata'
gem 'rdf-virtuoso'

gem 'pry'
gem 'pry-doc'

gem 'neo4apis-activerecord'

source 'https://rails-assets.org' do
  gem 'rails-assets-vis', '= 4.7.0'
  gem 'rails-assets-reveal-js'
  gem 'rails-assets-jquery.countdown'
  gem 'rails-assets-anchor-js'
end

group :development do
  gem 'bullet'
  gem 'brakeman', require: false
  gem 'rubocop',  require: false
  gem 'capistrano', '~> 3.1'
  gem 'capistrano-rails', '~> 1.1'
end

group :test do
  gem "codeclimate-test-reporter", require: nil
end

#############################################################
# may be useful in the future
#############################################################

# manual: http://codetutr.com/2015/02/05/render-markdown-in-rails-with-redcarpet-and-smartypants/
# gem 'redcarpet'

# gem 'date_validator'
# gem 'cancancan'
# gem 'paperclip', '~> 4.3'

gem 'sxp'

gem 'generic_edit_and_destroy_links', git: 'https://github.com/teksisto/generic_edit_and_destroy_links.git'

