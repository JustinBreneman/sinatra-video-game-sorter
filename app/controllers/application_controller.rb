require './config/environment'

class ApplicationController < Sinatra::Base
    configure do
        enable :sessions
        set :session_secret, 'secret'
        set :views, 'app/views'
    end
    
    get '/' do
        @users = User.all
        @platforms = Platform.all
        @games = Game.all
        erb :'index'
    end
end