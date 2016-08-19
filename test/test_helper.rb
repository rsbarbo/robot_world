ENV["RACK_ENV"] = "test"

require File.expand_path("../../config/environment", __FILE__)
require "minitest/autorun"
require "minitest/pride"
require "capybara/DSL"

module TestHelpers

  def teardown
    robot_manager.delete_all
    super
  end

  def robot_manager
    database = SQLite3::Database.new("db/robot_manager_test.db")
    database.results_as_hash = true
    RobotWorld.new(database)
  end

  Capybara.app = RobotWorldApp

  class FeatureTest < Minitest::Test
    include Capybara::DSL
    include TestHelpers
  end

end
