require 'sinatra'
require 'sqlite3'
# require 'yaml'
# require 'psych'
require 'compass'
# require 'mongo'
require 'active_record'

ActiveRecord::Base.establish_connection(
    adapter: "sqlite3",
    database: "d3.sqlite3"
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
    get '/test2' do
        @d3datas = Post.all()
        erb:'index'
    end
    post '/new' do
        # Comment
        # post = Post.new(:name => 'um01',:date => '2014-3-5',:send => '19',:open => '0',:clickpc => '4',:clickpcnumber => '4',:clicksp => '9',:clickspnuymber => '1',:sendclick => '2',:sendopen => '26',:favorite => '0',:apply => '0',:applypass => '0',:created_a => '2014.4.14',:updated_at => '2014.4.14')
        post = Post.new
        post.name = "um01"
        post.date = '2014.3.5'
        post.send = '19'
        post.open = '0'
        post.clickpc = '4'
        post.clickpcnumber = '9'
        post.clicksp = '1'
        post.clickspnuymber = '2'
        post.sendclick = '26'
        post.sendopen = '0'
        post.favorite = '0'
        post.apply = '0'
        post.applypass = '0'
        post.save
        redirect '/test'
    end
    get '/style.css' do
    	scss:'style',:style => :expanded,:line_comments => false,:cache=>false
    end
end
