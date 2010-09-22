require 'rubygems'
require 'sinatra'
require 'sass'
require 'compass'
require 'haml'

# configure do 
#  Compass.configuration.parse(File.join(Sinatra::Application.root, 'config', 'compass.config'))
# end

configure do
  Compass.configuration do |config|
    config.project_path = File.dirname(__FILE__)
    config.sass_dir = 'views'
  end
  
  set :haml, { :format => :html5 }
  set :sass, Compass.sass_engine_options
end

get '/' do
  haml :index #, :layout => false
end

get '/:page' do
  haml params[:page].to_sym
end

=begin
get '/screen.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :screen
end
=end

get '/stylesheets/:name.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass(:"stylesheets/#{params[:name]}")#, Compass.sass_engine_options )
end
