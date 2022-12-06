require 'rails_helper'

RSpec.describe 'the participant edit' do 
  before :each do 
    @race = Race.create!(
      name: "Turkey Trot",
      location: "Salida",
      professional_racers_only: false,
      kilometers: 50,
      date: DateTime.parse('20-05-2023')
    )
    @participant = Participant.create!(
      first_name: "Dean",
      last_name: "Kelly",
      professional_racer: true,
      age: 87,
      race_id: @race.id
    )
  end

  it 'links to the edit page' do
    visit "/participants/#{@participant.id}"

    click_button "Edit #{@participant.first_name}"

    expect(current_path).to eq("/participants/#{@participant.id}/edit")
  end

  it 'can edit a participant' do 
    visit "/participants/#{@participant.id}"

    expect(page).to have_content("Dean")

    click_button "Edit Dean"
    fill_in "First name", with: "Mike"
    click_button "Update Participant"

    expect(current_path).to eq("/participants/#{@participant.id}")
    expect(page).to have_content("Mike")
  end
end