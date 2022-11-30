require 'rails_helper'

RSpec.describe Race, type: :model do 
  describe 'attributes' do 
    it 'has an id, created_at, updated_at, name, location, professional_racers_only, kilometers, and a date' do
      race = Race.create(
        name: "Turkey Trot", 
        location: "Salida", 
        professional_racers_only: false, 
        kilometers: 10, 
        date: Date.today
      )

      expect(race.name).to eq("Turkey Trot")
      expect(race.location).to eq("Salida")
      expect(race.professional_racers_only).to be false
      expect(race.kilometers).to eq(10)
      expect(race.date).to eq(Date.today)
      expect(race.id).not_to be nil
      expect(race.created_at).not_to be nil
      expect(race.created_at.class.name).to eq("Time")
      expect(race.updated_at).not_to be nil
      expect(race.updated_at.class.name).to eq("Time")
    end
  end

  describe 'relationships' do
    it { should have_many(:participants) }
  end
end