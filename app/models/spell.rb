class Spell < ApplicationRecord
  has_and_belongs_to_many :books
    
    def self.order_by field
      return Spell.order(:name)  #         //PARAMETER 2
    end
end
