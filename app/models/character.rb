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
      spell_ids = Array.new
      id = spells.select(:id).to_a
      id.each do |x|
          spell_ids.push(x.id)
      end
      
      return spell_ids
  end

  def lister 
      spell_ids = Array.new
      id = spells.select(:id).to_a
      id.each do |x|
          spell_ids.push(Spell.find(x.id).name)
      end
      
      return spell_ids
  end
end
