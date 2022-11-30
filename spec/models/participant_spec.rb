require 'rails_helper'

RSpec.describe Participant, type: :model do 
  describe 'attributes' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:professional_racer) }
    it { should validate_presence_of(:age) }
  end
  
  describe 'relationships' do 
    it { should belong_to(:race) }
  end
end