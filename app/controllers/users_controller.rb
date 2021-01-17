class UsersController < ApplicationController

    get '/users/' do
        @users = User.all
        erb :'users/index'
    end
    
    get '/users/:slug' do
        @user = User.find_by_slug(params[:slug])
        if @user && Helpers.is_logged_in?(session)
            erb :'users/show'
        else
            redirect to '/login'
        end
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
        @user = User.find_by_slug(params[:slug])
        game_ids = params[:games]
        games = []
        game_ids.each do |id|
            games << Game.find(id)
        end
        @user.update(games: games)
        redirect to "/users/#{@user.slug}"
    end
end