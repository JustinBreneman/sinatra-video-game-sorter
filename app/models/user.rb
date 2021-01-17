class User < ActiveRecord::Base
    has_many :gameusers
    has_many :games, through: :gameusers
    has_many :platforms, through: :games
    has_secure_password

    def slug
        Helpers.slugify(self.username)
    end
end