class Spell < ApplicationRecord
    has_and_belongs_to_many :books
    validates_presence_of :name
    validates_length_of :name, maximum: 70

#     def add_to_book
#       return 
#     end
end
