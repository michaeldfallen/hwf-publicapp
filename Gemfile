source 'https://rubygems.org'

gem 'dotenv-rails', groups: [:development, :test] # this has to be here because of load order

gem 'rails', '~> 4.2.6'

gem 'config'
gem 'date_validator'
gem 'rest-client'
gem 'virtus'
gem 'zendesk_api'

gem 'govuk_frontend_toolkit', git: "https://github.com/alphagov/govuk_frontend_toolkit_gem.git", submodules: true
gem 'govuk_elements_rails', git: 'https://github.com/ministryofjustice/govuk_elements_rails.git', submodules: true
gem 'jquery-rails'
gem 'moj_template', '~> 0.23.2'
gem 'sass-rails', '5.0.4'
gem 'slim-rails'
gem 'uglifier', '>= 1.3.0'

gem 'unicorn'

gem 'rails_12factor', group: :production

group :development, :test do
  gem 'pry-rails'
  gem 'factory_girl_rails'
  gem 'rspec-rails', '~> 3.0'
  gem 'rubocop', '~>0.37.2', require: true
  gem 'rubocop-rspec', require: false
end

group :development do
  gem 'foreman'
  gem 'launchy'
  gem 'spring'
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'codeclimate-test-reporter', require: nil
  gem 'shoulda-matchers'
  gem 'timecop'
  gem 'webmock', require: false
end
