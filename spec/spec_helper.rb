require 'rack/test'
require 'rspec/padrino'
require 'capybara/rspec'

Capybara.app = Padrino.application

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