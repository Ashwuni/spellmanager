class Character < ApplicationRecord
  belongs_to :user
  has_many :books
    
    
  def num_books
     books.length     
  end
    
  # Creates and array of arrays to use in dropdown selects for author. For more info:  
  # https://guides.rubyonrails.org/form_helpers.html#select-boxes-for-dealing-with-model-objects
  def self.to_nested_array_for_select
     nested = []  
     Character.order(:name).each do |character|
         fullname = character.name+' '+character.lastname
         nested.push [class, character.id]
     end
     return nested 
  end
    
    
  def book_id
      book_ids = Array.new
      id = books.select(:id).to_a
      id.each do |x|
          book_ids.push(x.id)
      end
      
      return book_ids
  end

  def lister 
      book_ids = Array.new
      id = books.select(:id).to_a
      id.each do |x|
          book_ids.push(Book.find(x.id).title)
      end
      
      return book_ids
  end
end
