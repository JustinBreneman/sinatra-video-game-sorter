class Helpers
    def self.is_logged_in?(session)
        !!session[:id]
    end

    def self.slugify(phrase)
        !!phrase.downcase! ? text : text
        !!phrase.gsub!(/[^0-9A-Za-z ]/, '') ? phrase.split(" ").join("-") : phrase.split(" ").join("-")
    end
end