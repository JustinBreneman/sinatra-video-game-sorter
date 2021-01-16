class User < ActiveRecord::Base
    has_many :userplatforms
    has_many :platforms, through: :userplatforms
    has_many :games, through: :platforms
    has_secure_password

    def slug
        Helpers.slugify(self.username)
    end
end