class RobotWorldApp < Sinatra::Base
  set :root, File.join(File.dirname(__FILE__), '..')

  get '/' do
    erb :home
  end

  get '/dashboard' do
    erb :dashboard
  end

  get '/robots' do
    @robots = robot_world.all
    erb :index
  end

  def robot_world
    if ENV['RACK_ENV'] == "test"
      database = SQLite3::Database.new("db/robot_manager_test.db")
    else
      database = SQLite3::Database.new("db/robot_manager_development.db")
    end
    database.results_as_hash = true
    RobotWorld.new(database)
  end

end
