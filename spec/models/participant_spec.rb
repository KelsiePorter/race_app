require 'rails_helper'

RSpec.describe Participant, type: :model do 
  describe 'attributes' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:age) }
  end
  
  describe 'relationships' do 
    it { should belong_to(:race) }
  end

  describe 'class methods' do 
    describe 'professional_racers' do
      it 'returns all participants where professional_racer is true' do
        race_1 = Race.create!(
          name: "Turkey Trot",
          location: "Salida",
          professional_racers_only: false,
          kilometers: 50,
          date: DateTime.parse('20-05-2023')
        )
        participant_1 = Participant.create!(
          first_name: "Kristen",
          last_name: "Bell",
          professional_racer: true,
          age: 78,
          race_id: race_1.id
        ) 
        participant_2 = Participant.create!(
          first_name: "Tom",
          last_name: "Havorford",
          professional_racer: false,
          age: 40,
          race_id: race_1.id
        ) 
        participant_3 = Participant.create!(
          first_name: "Bodi",
          last_name: "Flaten",
          professional_racer: true,
          age: 8,
          race_id: race_1.id
        ) 
        participant_4 = Participant.create!(
          first_name: "Dean",
          last_name: "Kelly",
          professional_racer: false,
          age: 87,
          race_id: race_1.id
        )
        expect(Participant.professional_racers).to match_array([participant_1, participant_3])
      end
    end
  end
end