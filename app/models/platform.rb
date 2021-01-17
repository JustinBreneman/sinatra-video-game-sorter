class Platform < ActiveRecord::Base
    has_many :games
    has_many :users, through: :games

    def slug
        Helpers.slugify(self.name)
    end
end