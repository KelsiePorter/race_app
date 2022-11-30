require 'rails_helper'

RSpec.describe Participant, type: :model do 
  describe 'attributes' do
    it 'has an id, race_id, created_at, updated_at, first_name, last_name, professional_racer, and age' do 
      race = Race.create(
        name: "Turkey Trot", 
        location: "Salida", 
        professional_racers_only: false, 
        kilometers: 10, 
        date: Date.today
      )
      participant = Participant.create(
        first_name: "River",
        last_name: "Porter",
        professional_racer: true,
        age: 7,
        race_id: race.id
      )
 
      expect(participant.first_name).to eq("River")
      expect(participant.last_name).to eq("Porter")
      expect(participant.professional_racer?).to be true
      expect(participant.age).to eq(7)
      expect(participant.id).not_to be nil
      expect(participant.created_at).not_to be nil
      expect(participant.created_at.class.name).to eq("Time")
      expect(participant.updated_at).not_to be nil
      expect(participant.updated_at.class.name).to eq("Time")
    end
  end
  
  describe 'relationships' do 
    it { should belong_to(:race) }
  end
end