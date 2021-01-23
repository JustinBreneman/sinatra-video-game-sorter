class Game < ActiveRecord::Base
    belongs_to :platform
    has_many :gameusers
    has_many :users, through: :gameusers

    def slug
        title_slug = Helpers.slugify(self.title)
        platform_slug = Helpers.slugify(self.platform.name)
        title_slug + "_on_" + platform_slug
    end
end