ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../spec/dummy/config/environment", __FILE__)

require 'rspec/rails'
require 'mongoid'
require 'shoulda'
require 'database_cleaner'

Dir[Rails.root.join("spec/factories/**/*.rb")].each {|f| require f}
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  config.before(:each) do
    DatabaseCleaner.orm = "mongoid" 
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean
  end
  config.infer_base_class_for_anonymous_controllers = false

  config.order = "random"
end
