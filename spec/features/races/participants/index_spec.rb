require 'rails_helper'

RSpec.describe 'Races participants index' do 
  before :each do 
    @race_1 = Race.create!(
      name: "Turkey Trot",
      location: "Salida",
      professional_racers_only: false,
      kilometers: 50,
      date: DateTime.parse('20-05-2023')
    )
    @race_2 = Race.create!(
      name: "Tough Mudder",
      location: "Moab",
      professional_racers_only: true,
      kilometers: 10,
      date: DateTime.parse('05-11-2023')
    )
    
    @participant_1 = Participant.create!(
      first_name: "Kristen",
      last_name: "Bell",
      professional_racer: true,
      age: 78,
      race_id: @race_2.id
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
      race_id: @race_2.id
    ) 
    @participant_4 = Participant.create!(
      first_name: "Dean",
      last_name: "Kelly",
      professional_racer: false,
      age: 87,
      race_id: @race_1.id
    ) 
  end
  it 'displays the name of each participant in a race' do 
    visit "/races/#{@race_1.id}/participants"

    expect(page).to have_content(@participant_2.first_name)
    expect(page).to have_content(@participant_2.last_name)
    expect(page).to have_content(@participant_2.professional_racer)
    expect(page).to have_content(@participant_2.age)
    expect(page).to have_content(@participant_4.first_name)
    expect(page).to have_content(@participant_4.last_name)
    expect(page).to have_content(@participant_4.professional_racer)
    expect(page).to have_content(@participant_4.age)
  end

  it 'a link can sort the races participants in alphabetical order' do
    visit "/races/#{@race_1.id}/participants"

    click_link("Sort Alphabetically")

    expect(current_path).to eq("/races/#{@race_1.id}/participants")
    expect(page).to have_content("Havorford")
    expect(page).to have_content("Kelly")
  end
end