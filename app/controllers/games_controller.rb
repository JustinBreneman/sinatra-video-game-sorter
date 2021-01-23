class GamesController < ApplicationController
    
    get '/games/' do
        @games = Game.all
        @users = User.all
        erb :'games/index'
    end

    get '/games/new' do
        if Helpers.is_logged_in?(session)
            @platforms = Platform.all
            @user = User.find(session[:id])
            erb :'games/new'
        else
            redirect to '/login'
        end
    end

    post '/games/new' do
        if !!params[:platform][:name].empty? && !!params[:platform][:manufacturer].empty? && !!params[:platform][:id].empty?
            redirect to '/games/new'
        elsif !params[:platform][:id].empty?
            platform = Platform.find(params[:platform][:id])
        else
            platform = Platform.create(name: params[:platform][:name], manufacturer: params[:platform][:manufacturer])
        end
        user = User.find(session[:id])
        user.games.build(title: params[:game][:title], developer: params[:game][:developer], release_date: params[:game][:release_date], platform: platform)
        user.save
        redirect to '/games/'
    end

    get '/games/:slug' do
        @game = Game.find_by_slug(params[:slug])
        erb :'games/show'
    end

    get '/games/:slug/edit' do
        if Helpers.is_logged_in?(session)
            @game = Game.find_by_slug(params[:slug])
            @platforms = Platform.all
            erb :'games/edit'
        else
            redirect to '/login'
        end
    end

    post '/games/:slug' do
        game = Game.find_by_slug(params[:slug])
        if !params[:platform][:id].empty?
            platform = Platform.find(params[:platform][:id])
        else
            platform = Platform.create(name: params[:platform][:name], manufacturer: params[:platform][:manufacturer])
        end
        game.update(title: params[:game][:title], developer: params[:game][:developer], release_date: params[:game][:release_date], platform: platform)
        redirect to "/games/#{game.slug}"
    end
end