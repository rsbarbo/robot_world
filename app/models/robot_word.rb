require "yaml/store"
require_relative "task"

class TaskManager
  attr_reader :database

  def initialize(database)
    @database = database
  end

end
