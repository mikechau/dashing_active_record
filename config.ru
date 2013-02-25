require 'dashing'
require "sinatra/activerecord"
Dir["#{File.dirname(__FILE__)}/models/**/*.rb"].each { |f| puts f; require(f) }

set :database_file, "database.yml"



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