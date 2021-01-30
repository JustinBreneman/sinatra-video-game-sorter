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
            redirect to "/platforms/#{params[:slug]}"
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
end