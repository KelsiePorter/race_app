class Race < ApplicationRecord 
  has_many :participants, dependent: :destroy

  validates_presence_of :name,
                        :location,
                        :kilometers,
                        :date

  def formatted_date 
    self.date.strftime('%m/%d/%Y')
  end
end