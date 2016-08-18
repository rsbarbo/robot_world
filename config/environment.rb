require 'bundler'
Bundler.require

#Allow the file to go back to the root directory
APP_ROOT = File.expand_path("..", __dir__)

#Load all controllers based on the path given
Dir.glob(File.join(APP_ROOT, "app", "controllers", "*.rb")).each { |file| require file}

#Load all models based on the path given
Dir.glob(File.join(APP_ROOT, "app", "models", "*.rb")).each { |file| require file}

#it requires all the folders so you do not need to require all of them within
#the files itself
class TaskManagerApp < Sinatra::Base
  set :method_override, true
  set :root, APP_ROOT
  set :views, File.join(APP_ROOT, "app", "views")
  set :public_folder, File.join(APP_ROOT, "app", "public")
end
