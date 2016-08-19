require 'sqlite3'

class RobotWorld
  attr_reader :database

  def initialize(database)
    @database = database
  end

  def raw_robots
    database.execute("SELECT * FROM robots;")
  end

  def create(robot)
    database.execute("INSERT INTO robots
                       (title, description)
                      VALUES
                       ('#{robot[:title]}', '#{robot[:description]}');"
                    )
  end

  def all
    raw_robots.map { |data| Robot.new(data)}
  end

end
