require 'sinatra'
require 'sqlite3'
require 'yaml'
# require 'psych'
require 'compass'
# require 'mongo'
require 'active_record'

ActiveRecord::Base.establish_connection(
    "adapter"=>"sqlite3",
    "database"=>"d3data.db"
)
# ActiveRecord::Base.configurations = YAML.load_file('database.yml')
# ActiveRecord::Base.establish_connection('development')

class Post < ActiveRecord::Base
end

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

    #view部分
    get '/' do
        @d3data = Post.all()
    	haml:'index'
    end
    get '/test' do
        @d3datas = Post.all()
        erb:'index'
    end
    post '/new' do
        # Comment
        redirect '/'
    end
    get '/style.css' do
    	scss:'style',:style => :expanded,:line_comments => false,:cache=>false
    end
end