class RobotWorldApp < Sinatra::Base
  set :root, File.join(File.dirname(__FILE__), '..')

  get '/' do
    erb :home
  end

  get '/robots' do
    @robots = robot_world.all
    erb :index
  end

  get '/dashboard' do
    @average_age = robot_world.average_age
    @hired_by_year = robot_world.hired_by_year
    @department_count = robot_world.department_count
    @city_count = robot_world.city_count
    @state_count = robot_world.state_count
    erb :dashboard
  end

  get '/robots/new' do
    erb :new
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
