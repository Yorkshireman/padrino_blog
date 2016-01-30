source 'https://rubygems.org'

# Padrino supports Ruby version 1.9 and later
ruby '2.3.0'

# Distribute your app as a gem
# gemspec

# Server requirements
# gem 'thin' # or mongrel
# gem 'trinidad', :platform => 'jruby'

# Optional JSON codec (faster performance)
# gem 'oj'

# Project requirements
gem 'rake'

# Component requirements
gem 'bcrypt'
gem 'sass'
gem 'haml'
gem 'activerecord', '>= 3.1', :require => 'active_record'
gem 'sqlite3'
gem 'guard-rspec', require: false

# Test requirements
group :test do
  gem 'shoulda'
  gem 'rack-test', :require => 'rack/test'
  gem 'rspec-padrino'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'byebug'
end

# Padrino Stable Gem
gem 'padrino', '0.13.1'

# Or Padrino Edge
# gem 'padrino', :github => 'padrino/padrino-framework'

# Or Individual Gems
# %w(core support gen helpers cache mailer admin).each do |g|
#   gem 'padrino-' + g, '0.13.1'
# end
