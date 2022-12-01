class Participant < ApplicationRecord
  belongs_to :race

  validates_presence_of :first_name, 
                        :last_name, 
                        :age
end