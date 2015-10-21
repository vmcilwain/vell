require 'rails_helper'

feature 'blog category' do
  scenario 'administrator should be able to create a blog category' do
    visit new_blog_category_path
    sign_in_with(admin_user)
    fill_in 'blog_category_name', with: 'Ruby On Rails'
    click_button 'Create Blog category'

    expect(page).to have_content 'Blog Category Created!'
  end
end
