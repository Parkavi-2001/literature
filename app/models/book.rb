class Book < ApplicationRecord
    belongs_to :author

    def self.search(search)
        if search
            book_type = Book.find_by(name:search)
            if book_type
                self.where(id: book_type)
            else
                @books = Book.all
            end
        else
            @books = Book.all
        end
    end
end

