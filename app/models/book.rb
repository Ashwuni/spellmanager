class Book < ApplicationRecord
    has_and_belongs_to_many :spells
    validates_presence_of :name
    validates_length_of :name, maximum: 70
    
    
    def lister 
      book_ids = Array.new
      id = books.select(:id).to_a
      id.each do |x|
          book_ids.push(Book.find(x.id).title)
      end
      
      return book_ids
  end
end
