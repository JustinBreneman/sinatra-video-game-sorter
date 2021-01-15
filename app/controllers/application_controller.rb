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

    get '/login' do
        if !Helpers.is_logged_in?(session)
            erb :'users/login'
        end
    end

    post '/login' do
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            session[:id] = user.id
            redirect to '/'
        else
            redirect to '/login'
        end
    end

    get '/logout' do
        session.clear
        redirect to '/'
    end
end