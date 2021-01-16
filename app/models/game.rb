class Game < ActiveRecord::Base
    belongs_to :platform

    def slug
        Helpers.slugify(self.title)
    end
end