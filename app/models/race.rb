class Race < ApplicationRecord 
  has_many :participants

  validates_presence_of :name,
                        :location,
                        :professional_racers_only,
                        :kilometers,
                        :date
end