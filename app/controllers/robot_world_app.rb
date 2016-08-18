class RobotWorldApp < Sinatra::Base
  set :root, File.join(File.dirname(__FILE__), '..')
  

  get '/' do
    erb :dashboard
  end

  get '/robots' do
    @robots = robot_world.all
    erb :index
  end

  get '/robots/dashboard' do
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

  post '/robots' do
    robot_world.create(params[:robot])
    redirect '/robots'
  end

  get '/robots/:id' do |id|
    @robot = robot_world.find(id.to_i)
    erb :show
  end

  get '/robots/:id/edit' do |id|
    @robot= robot_world.find(id.to_i)
    erb :edit
  end

  put '/robots/:id' do |id|
    robot_world.update(id.to_i, params[:robot])
    redirect '/robots'
  end

  delete '/robots/:id' do |id|
    robot_world.destroy(id.to_i)
    redirect '/robots'
  end

  def robot_world
    if ENV['RACK_ENV'] == 'test'
      database = YAML::Store.new('db/robot_world_test.db')
    else
      database = YAML::Store.new('db/robot_world')
    end
    database.results_as_hash = true
    @robot_world ||= RobotWorld.new(database)
  end

end
