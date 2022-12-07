class Race < ApplicationRecord 
  has_many :participants, dependent: :destroy

  validates_presence_of :name,
                        :location,
                        :kilometers,
                        :date

  def participant_count
    participants.size
  end

  def racers_over_age(age)
    participants.over_age(age)
  end

  def racers_sorted_by_last_name
    participants.order(:last_name)
  end
end