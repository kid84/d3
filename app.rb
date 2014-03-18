require 'sinatra'
require 'compass'
require 'mongo'
require 'nokogiri'
require 'active_record'

ActiveRecord::Base.establish_connection(
    "adapter"=>"sqlite3",
    "database"=>"./mmg.db"
)

class Maildata < ActiveRecord::Base
end

class App < Sinatra::Base
	register Sinatra::Reloader
    # register Sinatra::ActiveRecordExtension
    # ActiveRecord::Base.establish_connection(
    # "adapter"=>"sqlite3",
    # "database"=>"./mmg.db"
    # )

    # class Maildata < ActiveRecord::Base
    # end
	
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
        @maildata = Maildata.all
    	haml:index
    end
    post '/new' do
        # Comment
        redirect '/'
    end
    get '/style.css' do
    	scss:'style',:style => :expanded,:line_comments => false,:cache=>false
    end
end