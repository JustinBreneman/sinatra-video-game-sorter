class PlatformsController < ApplicationController
    
    get '/platforms/' do
        @platforms = Platform.all
        erb :'platforms/index'
    end
end