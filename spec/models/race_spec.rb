require 'rails_helper'

RSpec.describe Race, type: :model do 
  describe 'attributes' do 
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:location) }
    it { should validate_presence_of(:professional_racers_only) }
    it { should validate_presence_of(:kilometers) }
    it { should validate_presence_of(:date) }
  end

  describe 'relationships' do
    it { should have_many(:participants) }
  end
end