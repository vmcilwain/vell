require 'rails_helper'

feature 'creating a blog category' do
  scenario 'administrator should be able to create a blog category' do
    sign_in
    click_link 'Blog Categories'
    click_link 'New Category'

    expect(page).to have_content 'Create Blog Category'

    fill_in 'blog_category_name', with: 'Ruby On Rails'
    click_button 'Create Blog category'

    expect(page).to have_content 'Blog Category Created!'
  end
end
