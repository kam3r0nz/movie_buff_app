require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base
  
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "460639bec4d1535d6f35002f16e95e6a06cf20a6513d07aa858636113f0c47465be75c07dbadcf82ff7efa4e65e00a387a4a97a4b9bd36be15297196e98b7a5e"
    use Rack::Flash, :sweep => true
  end

  get "/" do
    user = User.find_by(session[:user_id])
    if logged_in?
      redirect "/users/#{user.id}"
    else
      erb :index
    end
  end

  helpers do
    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
      !!current_user
    end

    def flash_types
      [:success, :notice, :warning, :error]
    end
  end

end