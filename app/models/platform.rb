class Platform < ActiveRecord::Base
    has_many :games
    has_many :userplatforms
    has_many :users, through: :userplatforms

    def slug
        Helpers.slugify(self.name)
    end
end