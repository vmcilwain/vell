require 'rails_helper'

feature 'remove a blog category' do
  scenario 'disable a blog category' do
    visit blog_categories_path

    blog_category

    click_link 'Blog Categories'
    
    expect(page).to have_link 'Delete'
    click_link 'Delete'

    expect(page).to have_text 'false'
  end
end