require 'sqlite3'

database = SQLite3::Database.new("db/robot_manager_development.db")

#delete current existent records from robot table before inserting new records;
#we start from the scratch
database.execute("DELETE FROM robots")

#Insert new records to the database
database.execute("INSERT INTO robots (title, description) VALUES
                  ('R1', 'AWESOME ROBOT'),
                  ('R2', 'AMAZING ROBOT');"
                 )

#Make sure data has actually been added to the database
puts "Data has been added to the database and:"
p database.execute("SELECT * FROM robots;")
