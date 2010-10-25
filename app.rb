require 'sinatra/base'
require 'sinatra_warden'
require 'rack/flash'

require 'app/warden'
require 'app/user'

class App < Sinatra::Base
  set :app_file, __FILE__

  enable :sessions
  use Rack::Flash
  use Rack::Session::Cookie

  use Warden::Manager do |manager|
    manager.default_strategies :password
    manager.failure_app = App
  end
  
  register Sinatra::Warden
  set :auth_failure_path, '/login'
  
  set :haml, :format => :html5

  get "/" do
    haml :welcome
  end
end
