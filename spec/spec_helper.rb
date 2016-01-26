RACK_ENV = 'test' unless defined?(RACK_ENV)
require File.expand_path(File.dirname(__FILE__) + "/../config/boot")
Dir[File.expand_path(File.dirname(__FILE__) + "/../app/helpers/**/*.rb")].each(&method(:require))

require 'rack/test'
require 'rspec/padrino'
require 'capybara/rspec'

Capybara.app = Rack::Builder.new do
  map "/" do
    run ::Padrino.application
  end
end.to_app

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.include RSpec::Padrino
  config.include Capybara::DSL

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end