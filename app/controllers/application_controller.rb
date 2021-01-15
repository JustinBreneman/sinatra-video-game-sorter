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

    get '/signup' do
        erb :'users/signup'
    end

    post '/signup' do
        users = User.all
        user = User.new(username: params[:username], email: params[:email], password: params[:password])
        if users.any?{ |u| u.email == user.email}
            redirect to '/signup'
        elsif users.any?{|u| u.username == user.username}
            redirect to '/signup'
        elsif user.save
            session[:id] = user.id
            redirect to '/'
        end
    end
end