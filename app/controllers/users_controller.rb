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
end