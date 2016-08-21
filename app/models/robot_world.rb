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
    (name, city, state, avatar, birthdate, date_hired,
    department) VALUES (?,?,?,?,?,?,?);",
    robot[:name],robot[:city],robot[:state],robot[:avatar],
    robot[:birthdate],robot[:date_hired], robot[:department])
  end

  def raw_robot(id)
    database.execute("SELECT * FROM robots WHERE id = ?;", id).first
  end

  def all
    raw_robots.map { |data| Robot.new(data)}
  end

  def find(id)
    Robot.new(raw_robot(id))
  end

  def update
    database.execute("UPDATE robots SET name= ?, city= ?, state= ?,
                      avatar= ?, birthdate= ?, date_hired= ?,
                      department= ? WHERE id=?;",
                      robot[:name],robot[:city],robot[:state],
                      robot[:avatar],robot[:birthdate],robot[:date_hired],
                      robot[:department],id
                    )
  end

  def destroy(id)
    database.execute("DELETE FROM robots WHERE id= ?;", id)
  end

  def delete_all
    database.execute("DELETE FROM robots;")
  end

  def average_age
    present_time = Time.new
    ages = raw_robots.map do |robot|
      result = Time.new(0) + (present_time - Time.strptime(robot["birthdate"], "%m/%d/%Y"))
      result.year
    end
    ages.reduce(:+)/ages.length
  end

end
