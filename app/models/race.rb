class Race < ApplicationRecord 
  has_many :participants, dependent: :destroy

  validates_presence_of :name,
                        :location,
                        :kilometers,
                        :date
end