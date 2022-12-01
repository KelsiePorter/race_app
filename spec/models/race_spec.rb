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
    describe '#formatted_date' do 
      it 'should format the date attribute as a string' do 
        race_2 = Race.create!(
          name: "Tough Mudder",
          location: "Moab",
          professional_racers_only: true,
          kilometers: 10,
          date: DateTime.parse('05-11-2023')
        )

        expect(race_2.date).to eq(DateTime.parse('05-11-2023'))
        expect(race_2.formatted_date).to eq('11/05/2023')
      end
    end
  end
end