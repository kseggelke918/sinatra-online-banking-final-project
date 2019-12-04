class ApplicationController < Sinatra::Base 
  configure do 
    set :views, 'app/views'
  end 
  
  get '/' do 
    <h1>Hello World</h1>
  end 
  
  get '/failure' do 
    erb :failure
  end 
  
  
end 