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
            flash[:message] = "Please login to edit your account."
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
        if !params[:email].include?('@') && !params[:email].include?('.com')
            flash[:message] = "Please enter a valid email."
            redirect to "/users/#{user.slug}/edit"
        elsif user.username != params[:username] && User.any?{|u| u.username == params[:username]}
            flash[:message] = "That username is already in use, please choose another one."
            redirect to "/users/#{user.slug}/edit"
        elsif user.email != params[:email] && User.any?{|u| u.email == params[:email]}
            redirect to "/users/#{user.slug}/edit"
        else
            flash[:message] = "Successfully updated your account."
            user.update(username: params[:username], email: params[:email], games: games)
            redirect to "/users/#{user.slug}"
        end
    end

    delete '/users/:slug' do
        user = User.find_by_slug(params[:slug])
        current_user = User.find(session[:id])
        if user == current_user && user.authenticate(params[:password]) && current_user.authenticate(params[:password])
            session.clear
            user.delete
            flash[:message] = "Your account has been successfully deleted."
            redirect to '/users/'
        else
            flash[:message] = "Please login to delete your account."
            redirect to "/users/#{user.slug}"
        end
    end
end