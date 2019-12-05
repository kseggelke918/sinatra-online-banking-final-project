class ApplicationController < Sinatra::Base 
  configure do 
    enable :sessions
    set :session_secret, "0puj230985rusdilfyfg"
    set :views, 'app/views'
  end 
  
  get '/' do 
    erb :index
  end 
  
  get '/failure' do 
    erb :failure
  end 
  
  
  
  
  
  
  
  private 
  
  helpers do
    def logged_in?
      !!current_user # well always yeild false
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
  end
  
  
end 