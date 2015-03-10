require 'rails_helper'

feature 'blog category errors' do
  scenario 'blog category should present error when invalid' do
    sign_in
    click_link 'Blog Categories'
    click_link 'New Category'
    expect(page).to have_content 'Create Blog Category'

    click_button 'Create Blog category'

    expect(page).to have_content "Name can't be blank"
  end
end
