class Spell < ApplicationRecord
    has_and_belongs_to_many :books
    validates_presence_of :name
    validates_length_of :name, maximum: 70
     skip_before_filter :verify_authenticity_token  
 skip_before_action :verify_authenticity_token


#     def add_to_book
#       return 
#     end
end
