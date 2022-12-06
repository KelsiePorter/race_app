require 'rails_helper'

RSpec.describe 'the race edit' do 
  it 'links to the edit page' do 
    race_1 = Race.create!(
      name: "Turkey Trot",
      location: "Salida",
      professional_racers_only: false,
      kilometers: 50,
      date: DateTime.parse('20-05-2023')
    )
    visit '/races'
    click_button "Edit #{race_1.name}"

    expect(current_path).to eq("/races/#{race_1.id}/edit")
  end

  it 'can edit the race' do 
    race_1 = Race.create!(
      name: "Turkey Trooot",
      location: "Salida",
      professional_racers_only: false,
      kilometers: 50,
      date: DateTime.parse('20-05-2023')
    )
    visit "/races"

    expect(page).to have_content("Turkey Trooot")

    click_button "Edit Turkey Trooot"

    fill_in "Name", with: "Turkey Trot"
    click_button "Update Race"

    expect(current_path).to eq("/races") 
    expect(page).to have_content("Turkey Trot")
  end
end