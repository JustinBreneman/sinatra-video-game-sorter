class Helpers
    def self.is_logged_in?(session)
        !!session[:id]
    end

    def self.current_user(session)
        if self.is_logged_in?(session)
            User.find(session[:id])
        end
    end

    def self.slugify(phrase)
        if !!phrase.gsub!(/[^0-9A-Za-z ]/, '')
            phrase.split(" ").join("-")
        else
            phrase.split(" ").join("-")
        end
        if !!phrase.downcase!
            phrase
        else
            phrase
        end
    end
end