require 'dashing'
require "sinatra/activerecord"
use ActiveRecord::ConnectionAdapters::ConnectionManagement
ActiveRecord::Base.establish_connection(
  adapter:  'sqlite3',
  database: 'test.sqlite3',
  host:     'localhost',
)

#set :database, "sqlite3:///test.sqlite3"
#set :database, {adapter: "sqlite3", database: "test.sqlite3"}

configure do
  set :auth_token, 'YOUR_AUTH_TOKEN'

  helpers do
    def protected!
     # Put any authentication code you want in here.
     # This method is run before accessing any resource.
    end
  end
end

map Sinatra::Application.assets_prefix do
  run Sinatra::Application.sprockets
end

run Sinatra::Application