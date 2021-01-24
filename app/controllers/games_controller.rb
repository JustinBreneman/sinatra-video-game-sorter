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
            flash[:message] = "Please login to add a new game"
            redirect to '/login'
        end
    end

    post '/games/new' do
        if !!params[:platform][:name].empty? && !!params[:platform][:manufacturer].empty? && !!params[:platform][:id].empty?
            flash[:message] = "Please either add a new platform or choose an existing one."
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
        if @game != "" && !!@game
            erb :'games/show'
        else
            redirect to '/games/'
        end
    end

    get '/games/:slug/edit' do
        @game = Game.find_by_slug(params[:slug])
        @platforms = Platform.all
        if Helpers.is_logged_in?(session) && @game != "" && !!@game
            erb :'games/edit'
        else
            flash[:message] = "Please login to edit a game."
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

    get '/games/:slug/delete' do
        game = Game.find_by_slug(params[:slug])
        if Helpers.is_logged_in?(session) && @game != "" && !!@game
            user.find(session[:id])
            if !!game
                flash[:message] = "Could not find the game to delete."
                redirect to '/games/'
            elsif game.users.include?(user) && game.users.count > 1
                game.users.delete(user)
                flash[:message] = "#{game.title} on #{game.platform} has been removed from your account."
                redirect to '/games/'
            elsif game.users.count == 0 || (game.users.include?(user) && game.users.count == 1)
                game.delete
                flash[:message] = "#{game.titlle} on #{game.platform} has been deleted."
                redirect to '/games/'
            else
                flash[:message] = "#{game.title} on #{game.platform} is not on your account."
                redirect to '/games/'
            end
        else
            flash[:message] = "Please login to delete a game."
            redirect to '/login'
        end
    end
end