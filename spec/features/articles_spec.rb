require 'spec_helper'
require 'rails_helper'

describe 'Articles' do
  describe 'Manage articles' do
    it 'Adds a new article and displays the results' do
      visit ('/articles')
      expect{
        click_link 'New Article'
        fill_in 'Name', with: 'Some article name'
        fill_in 'Description', with: 'Some name'
        fill_in 'Price', with: rand(10.0..100.99)
        fill_in 'Total in shelf', with: rand(1...100)
        fill_in 'Total in vault', with: rand(1...100)
        select 'Pallet Store', from: 'article_store_id'
        click_button 'Create Article'
      }.to change(Article,:count).by(1)
      expect(page).to have_content 'Article was successfully created.'
      expect(page).to have_content 'Some article name'
    end
  end
end