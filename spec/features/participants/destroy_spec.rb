require 'rails_helper'

RSpec.describe 'destroy a participant' do 
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

  end
  it 'can delete a participant from the participant show page' do 
    visit "/participants/#{@participant_1.id}"

    click_button "Delete #{@participant_1.first_name}"

    expect(current_path).to eq('/participants')
    expect(page).not_to have_content("Kristen")
  end
end