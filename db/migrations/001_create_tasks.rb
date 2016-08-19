require 'sqlite3'

environments = ["test", "development"]

environments.each do |environment|
  database = SQLite3::Database.new("db/robot_manager_#{environment}.db")
  database.execute("CREATE TABLE robots (id INTEGER PRIMARY KEY AUTOINCREMENT,
                    title VARCHAR(64), description VARCHAR(64));"
                   )
  puts "creating robots table for #{environment}"

end
