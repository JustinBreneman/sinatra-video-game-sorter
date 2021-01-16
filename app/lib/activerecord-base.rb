class ActiveRecord::Base
    def self.find_by_slug(slug)
        item = ""
        self.all.each do |i|
            if i.slug == slug
                item = i
            end
        end
        item
    end
end