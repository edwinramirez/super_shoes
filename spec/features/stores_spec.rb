require 'spec_helper'
require 'rails_helper'

describe 'Stores' do
  describe 'Manage stores' do
    it 'Adds a new store and displays the results' do
      visit ('/stores')
      expect{
        click_link 'New Store'
        fill_in 'Name', with: 'Some name'
        fill_in 'Address', with: 'Some address'
        click_button 'Create Store'
      }.to change(Store,:count).by(1)
      expect(page).to have_content 'Store was successfully created.'
      expect(page).to have_content 'Some address'
    end
  end
end