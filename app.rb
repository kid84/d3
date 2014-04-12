require 'sinatra'
require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'mmg.sqlite3'
)
class Test < ActiveRecord::Base
end
get '/' do
	@test = Test.all()
	erb:index
end