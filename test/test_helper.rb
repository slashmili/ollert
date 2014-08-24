ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require 'minitest/autorun'
require 'minitest/spec'

require "minitest/pride"

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!
  include FactoryGirl::Syntax::Methods
  self.use_transactional_fixtures = false
end

class ActionController::TestCase
    include Devise::TestHelpers
end
