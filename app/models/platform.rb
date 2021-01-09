class Platform < ActiveRecord::Base
    has_many :games
    has_many :userplatforms
    has_many :users, through: :userplatforms
end