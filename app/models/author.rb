class Author < ApplicationRecord
    has_many :books

    def self.search(search)
        if search
            author_type = Author.find_by(name:search)
            if author_type
                self.where(id: author_type)
            else
                @authors = Author.all
            end
        else
            @authors = Author.all
        end
    end
end
