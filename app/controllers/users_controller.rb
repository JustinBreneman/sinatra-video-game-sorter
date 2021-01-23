class UsersController < ApplicationController

    get '/users/' do
        @users = User.all
        erb :'users/index'
    end
    
    get '/users/:slug' do
        @user = User.find_by_slug(params[:slug])
        if Helpers.is_logged_in?(session)
            @current_user = User.find(session[:id])
        end
        erb :'users/show'
    end

    get '/users/:slug/edit' do
        @user = User.find_by_slug(params[:slug])
        if @user && Helpers.is_logged_in?(session)
            @platforms = Platform.all
            erb :'users/edit'
        else
            redirect to '/login'
        end
    end

    patch '/users/:slug' do
        user = User.find_by_slug(params[:slug])
        game_ids = params[:games]
        games = []
        game_ids.each do |id|
            games << Game.find(id)
        end
        if User.any?{|u| u.username == user.username}
            redirect to "/users/#{user.slug}/edit"
        elsif User.any?{|u| u.email == user.email}
            redirect to "/users/#{user.slug}/edit"
        else
            user.update(username: params[:username], email: params[:email], games: games)
        end
        redirect to "/users/#{user.slug}"
    end

    delete '/users/:slug' do
        user = User.find_by_slug(params[:slug])
        current_user = User.find(session[:id])
        if user == current_user && user.authenticate(params[:password]) && current_user.authenticate(params[:password])
            session.clear
            user.delete
            redirect to '/users/'
        else
            redirect to "/users/#{user.slug}"
        end
    end
end