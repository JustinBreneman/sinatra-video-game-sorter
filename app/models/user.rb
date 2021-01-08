class User < ActiveRecord::Base
    has_many :platforms
    has_many :games, through: :platforms
end