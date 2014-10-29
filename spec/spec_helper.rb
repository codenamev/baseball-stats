ENV["APP_ENV"] ||= 'test'
require 'rubygems'
require 'active_record'
require 'shoulda/matchers'
require 'database_cleaner'
require 'factory_girl'

$LOAD_PATH << 'lib'
require 'baseball_stats'

Dir[File.expand_path('../support/**/*.rb', __FILE__)].each {|f| require f}
Dir[File.expand_path('../db/migrations/*.rb', __FILE__)].each {|f| require f}

RSpec.configure do |config|
  config.include CommandLineHelpers
  config.include FactoryGirl::Syntax::Methods

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
    mocks.syntax = [:should, :expect]
  end

  config.before(:each) do
    stub_std_out
  end

  config.after(:each) do
    reset_command_line
  end
end
