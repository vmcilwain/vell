require 'rails_helper'

feature 'viewing blog category index' do
  scenario 'view list of blog categories' do
    visit '/'
    
    click_link 'Blog Categories'
    
    expect(page).to have_content 'Blog Categories'
  end
end