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
    erb :dashboard
  end

  get '/robots/new' do
    erb :new
  end

  post '/robots' do
    robot_world.create(params[:robot])
    redirect 'robots'
  end

  get '/robots/:id' do |id|
    @robot = robot_world.find(id.to_i)
    erb :show
  end

  get '/robots/:id/edit' do |id|
    @robot = robot_world.find(params[:id].to_i)
    erb :edit
  end

  put '/robots/:id' do
    robot_world.update(params[:id.to_i], params[:robot])
    redirect "/robots/ #{params[:id]}"
  end

  delete '/robots/:id' do
    robot_world.destroy(params[:id].to_i)
    redirect '/robots'
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
