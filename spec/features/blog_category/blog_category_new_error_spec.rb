require 'rails_helper'

feature 'blog category errors' do
  scenario 'blog category should present error when invalid' do
    visit new_blog_category_path
    expect(page).to have_content 'Create Blog Category'

    click_button 'Create Blog category'

    expect(page).to have_content "Name can't be blank"
  end
end