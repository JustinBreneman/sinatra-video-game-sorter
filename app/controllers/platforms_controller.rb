class PlatformsController < ApplicationController
    
    get '/platforms/' do
        @platforms = Platform.all
        erb :'platforms/index'
    end

    get '/platforms/new' do
        if Helpers.is_logged_in?(session)
            erb :'platforms/new'
        else
            redirect to '/login'
        end
    end

    post '/platforms/new' do
        platform = Platform.create(name: params[:name], manufacturer: params[:manufacturer])
        redcirect to '/platforms/'
    end
end