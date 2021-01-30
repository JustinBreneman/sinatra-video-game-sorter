class PlatformsController < ApplicationController
    
    get '/platforms/' do
        @platforms = Platform.all
        erb :'platforms/index'
    end

    get '/platforms/new' do
        if Helpers.is_logged_in?(session)
            erb :'platforms/new'
        else
            flash[:message] = "Please login to add a new platform."
            redirect to '/login'
        end
    end

    post '/platforms/new' do
        platform = Platform.create(name: params[:name], manufacturer: params[:manufacturer])
        redirect to '/platforms/'
    end

    get '/platforms/:slug' do
        @platform = Platform.find_by_slug(params[:slug])
        erb :'/platforms/show'
    end

    get '/platforms/:slug/edit' do
        @platform = Platform.find_by_slug(params[:slug])
        if Helpers.is_logged_in?(session)
            erb :'platforms/edit'
        else
            flash[:message] = "Please login to edit a Platform."
            redirect to '/login'
        end
    end

    post '/platforms/:slug' do
        platform = Platform.find_by_slug(params[:slug])
        if !params[:name] || params[:name] == ''
            flash[:message] = "Platforms must have a name."
            redirect to "/platforms/#{params[:slug]}/edit"
        elsif !params[:manufacturer] || params[:manufacturer] == ''
            flash[:message] == "Platforms must have a manufacturer."
            redirect to "/platforms/#{params[:slug]}/edit"
        else
            platform.update(name: params[:name], manufacturer: params[:manufacturer])
            redirect to "/platforms/#{platform.slug}"
        end
    end

    get '/platforms/:slug/delete' do
        platform = Platform.find_by_slug(params[:slug])
        if !Helpers.is_logged_in?(session)
            flash[:message] = "Please login to delete a Platform."
            redirect to '/login'
        elsif platform.users.count > 1
            flash[:message] = "Please ensure that all users are have removed this platform from their account before proceeding."
            redirect to "/platforms/#{params[:slug]}"
        elsif (platform.users.count == 1 && platform.users.include?(User.find(session[:id]))) || platform.users.count == 0
            platform.games.each{|game| game.delete}
            platform.delete
            redirect to '/platforms/'
        end
    end
end