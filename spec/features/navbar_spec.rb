require 'rails_helper'

RSpec.describe 'navbar' do 
  describe 'all pages' do
    routes = ['/races', '/participants']

    it 'links to the races index' do 
      visit routes.sample 

      expect(page).to have_link("Races", href: '/races')
    end
    it 'links to the participants index' do 
      visit routes.sample 

      expect(page).to have_link("Participants", href: '/participants')
    end
  end
end