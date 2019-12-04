class ApplicationController < Sinatra::Base 
  configure do 
    set :views, 'app/views'
  end 
  
  get '/' do 
    erb :index
  end 
  
  get '/failure' do 
    erb :failure
  end 
  
  
end 