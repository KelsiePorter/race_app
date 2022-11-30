require 'rails_helper'

RSpec.describe Participant, type: :model do 
  describe 'attributes' do
    it 'has an id, race_id, created_at, updated_at, first_name, last_name, professional_racer, and age' do 
      
    end
  end
  
  describe 'relationships' do 
    it { should belong_to(:race) }
  end
end