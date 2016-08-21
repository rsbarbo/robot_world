require 'sqlite3'

database = SQLite3::Database.new("db/robot_manager_development.db")

database.execute("DELETE FROM robots")

database.execute("INSERT INTO robots
                  (name, city, state, avatar, birthdate, date_hired, department)
                  VALUES
                  ('Robot1', 'Santos', 'SP', '1', '5/29/1984', '8/10/2016', 'Vendas'),
                  ('Robot2', 'Denver', 'CO', '2', '5/28/1984', '8/01/2016', 'Sales');"
                )

puts "It worked and:"
p database.execute("SELECT * FROM robots;")
