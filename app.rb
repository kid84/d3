require 'sinatra'
require 'compass'
require 'mongo'

class App < Sinatra::Base
	register Sinatra::Reloader
	
	# Compassの設定
	configure do
    	Compass.configuration do |config|
      		config.project_path = File.dirname(__FILE__)
      		config.sass_dir = 'views'
    	end
    	set :haml, { format: :html5 }
    	set :sass, Compass.sass_engine_options
    	set :scss, Compass.sass_engine_options
    end
    
    get '/' do
    	haml:'index'
    end
    get '/style.css' do
    	scss:'style',:style => :expanded,:line_comments => false,:cache=>false
    end
end