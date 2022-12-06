require 'rails_helper'

RSpec.describe 'destroy a race' do
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
  end

  it 'can delete the race from the race show page' do 
    visit "/races/#{@race_1.id}"

    click_button "Delete #{@race_1.name}"

    expect(current_path).to eq('/races')
    expect(page).not_to have_content("Turkey Trot")
  end 
end