require 'rubygems'
require 'sinatra'

require 'compass'
require 'haml'

configure do 
  Compass.configuration.parse(File.join(Sinatra::Application.root, 'config', 'compass.config'))
end

get '/' do
  haml :index #, :layout => false
end

get '/:page' do
  haml params[:page].to_sym
end


get '/stylesheets/:name.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass(:"stylesheets/#{params[:name]}")#, Compass.sass_engine_options )
end