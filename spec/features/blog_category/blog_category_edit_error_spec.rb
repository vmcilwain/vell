require 'rails_helper'

feature 'blog category errors' do
  scenario 'blog category should present error when invalid' do
    blog_category
    
    visit blog_categories_path
    
    expect(page).to have_link 'Edit'
    
    click_link 'Edit'
    
    fill_in 'blog_category_name', with: ''
    
    click_button 'Update Blog category'
    
    expect(page).to have_content "Name can't be blank"
  end
end
