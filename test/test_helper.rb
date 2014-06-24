ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require 'minitest/autorun'
require 'minitest/spec'

# To add Capybara feature tests add `gem "minitest-rails-capybara"`
# to the test group in the Gemfile and uncomment the following:
require "minitest/rails/capybara"

require "minitest/pride"
class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all
  #self.use_transactional_fixtures = false

  # Add more helper methods to be used by all tests here...
end

class MiniTest::Spec
  #TODO:check why it's not working
  include FactoryGirl::Syntax::Methods
end

class ActionController::TestCase
    include Devise::TestHelpers
end

#TODO: why I cant load it from it's own directory?
FactoryGirl.define do
  factory :board do
    title = 'FooBoard'
  end

  factory :user do
    email 'foo@example.com'
    password 'f4k3p455w0rd'
  end

  factory :card do
    title 'Card title'
    list_id 0
  end
end
