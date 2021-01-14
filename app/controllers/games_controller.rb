class GamesController < ApplicationController
    
    get '/games/' do
        @games = Game.all
        @users = User.all
        erb :'games/index'
    end
end