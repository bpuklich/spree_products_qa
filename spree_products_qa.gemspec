# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_products_qa'
  s.version     = '3.0.0'
  s.summary     = 'Spree extension that adds Q&A support for products'
  s.description = 'Each product can have separate Q&A section. Registered users can ask a question, that admins answer.'
  s.required_ruby_version = '>= 1.9.3'

  s.author    = 'Netguru'
  s.email     = 'hi@netguru.co'
  s.homepage  = 'http://netguru.co'

  #s.files       = `git ls-files`.split("\n")
  #s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '~> 3.0.0'
  s.add_dependency 'spree_backend', '~> 3.0.0'
  s.add_dependency 'sidekiq'

  s.add_development_dependency 'capybara'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_girl'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails',  '~> 2.13'
  s.add_development_dependency 'sass-rails', '~> 4.0.3'
  s.add_development_dependency 'selenium-webdriver'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'pry'
end
