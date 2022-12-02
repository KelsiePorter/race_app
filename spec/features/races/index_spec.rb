require 'rails_helper'

RSpec.describe 'the races index page' do 
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
  it 'displays the name of each race in the system' do 
    visit '/races'

    expect(page).to have_content(@race_1.name)
    expect(page).to have_content(@race_2.name)
  end

  it 'displays the races in the order they were created (most recent first)' do
    # figure out how to test order on the page
    @race_1.update!(created_at: DateTime.parse('29-04-2023'))
    @race_2.update!(created_at: DateTime.parse('30-04-2023'))

    visit '/races'

    expect(page).to have_content(@race_1.name)
    expect(page).to have_content(@race_2.name)
    expect(page).to have_content('Date Created: 04/29/2023')
    expect(page).to have_content('Date Created: 04/30/2023')
  end
end