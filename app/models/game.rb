class Game < ActiveRecord::Base
    belongs_to :platform
    has_many :gameusers
    has_many :users, through: :gameusers

    def slug
        Helpers.slugify(self.title)
    end
end