require 'rails_helper'

RSpec.describe Race, type: :model do 
  describe 'attributes' do 
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:location) }
    it { should validate_presence_of(:kilometers) }
    it { should validate_presence_of(:date) }
  end

  describe 'relationships' do
    it { should have_many(:participants) }
  end

  describe 'instance methods' do 
    before :each do
      @race_1 = Race.create!(
        name: "Turkey Trot",
        location: "Salida",
        professional_racers_only: false,
        kilometers: 50,
        date: DateTime.parse('20-05-2023')
      )
      @participant_1 = Participant.create!(
        first_name: "Kristen",
        last_name: "Bell",
        professional_racer: true,
        age: 78,
        race_id: @race_1.id
      ) 
      @participant_2 = Participant.create!(
        first_name: "Tom",
        last_name: "Havorford",
        professional_racer: false,
        age: 40,
        race_id: @race_1.id
      ) 
      @participant_3 = Participant.create!(
        first_name: "Bodi",
        last_name: "Flaten",
        professional_racer: true,
        age: 8,
        race_id: @race_1.id
      ) 
      @participant_4 = Participant.create!(
        first_name: "Dean",
        last_name: "Kelly",
        professional_racer: false,
        age: 87,
        race_id: @race_1.id
      )
    end
    describe '#participant_count' do
      it 'returns the number of participants in a race' do

        expect(@race_1.participant_count).to eq(4)
      end
    end

    describe '#racers_over_age' do
      it 'returns the races participants over the provided age threshold' do

        expect(@race_1.racers_over_age(40)).to match_array([@participant_1, @participant_4])
      end
    end

    describe '#racers_sorted_by_last_name' do
      it 'returns the races participants in acending ordered by last name' do

        expect(@race_1.racers_sorted_by_last_name).to match_array([@participant_1, @participant_3, @participant_2, @participant_4])
        expect(@race_1.racers_sorted_by_last_name).to be_an(ActiveRecord::Relation)
        expect(@race_1.racers_sorted_by_last_name.to_a).to eq([@participant_1, @participant_3, @participant_2, @participant_4])
      end
    end
  end
end