require 'rails_helper'

RSpec.describe 'the Race creation' do 
  it 'links to the new page from the artists index page' do 
    visit '/races'

    click_link("New Race")
    expect(current_path).to eq('/races/new')
  end

  it 'can create a new race' do 
    visit '/races/new'
    save_and_open_page

    fill_in("Name", with: "Copper 10k")
    fill_in("Location", with: "Copper")
    fill_in("Kilometers", with: "10")
    fill_in("Date", with: "25-08-2022")
    fill_in("Professional racers only", with: "true")
    click_button("Create Race")

    new_race_id = Race.last.id
    expect(current_path).to eq("/races")
    expect(page).to have_content("Copper 10k")
  end
end