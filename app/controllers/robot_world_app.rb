class RobotWorldApp < Sinatra::Base
  set :root, File.join(File.dirname(__FILE__), '..')

  get '/' do
    erb :dashboard
  end

  get '/robots' do
    # @robot = robot_world_db.all
    erb :index
  end

  get '/robots/new' do
    erb :new
  end

  def robot_world_db
    @database ||= YAML::Store.new("db/robotworlddb")
  end

end
