require 'rails_helper'

RSpec.describe 'the race participant creation' do 
  before :each do 
    @race_2 = Race.create!(
      name: "Tough Mudder",
      location: "Moab",
      professional_racers_only: true,
      kilometers: 10,
      date: DateTime.parse('05-11-2023')
    )
  end
  it 'links to the new participant page from the race participant index' do 
    visit "/races/#{@race_2.id}/participants"

    click_link('New Participant')

    expect(current_path).to eq("/races/#{@race_2.id}/participants/new")
  end

  it 'can create a new participant for a race' do 
    visit "/races/#{@race_2.id}/participants/new"

    fill_in('First name', with: "AJ")
    fill_in('Last name', with: "Parker")
    fill_in('Professional racer', with: "true")
    fill_in('Age', with: "98")
    click_button("Create Participant")

    expect(current_path).to eq("/races/#{@race_2.id}/participants")
    expect(page).to have_content("AJ")
  end
end