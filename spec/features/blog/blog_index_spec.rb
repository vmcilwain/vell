require 'rails_helper'

feature 'viewing blogs index' do
  scenario 'view blog listing' do
    visit "/"
    
    click_link 'Blogs'
    
    expect(page).to have_content 'Blog Listing'
  end
end