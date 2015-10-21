require 'rails_helper'

feature 'blog category' do
  scenario 'blog category should present error when invalid' do
    visit new_blog_category_path
    sign_in_with(admin_user)
    click_button 'Create Blog category'

    expect(page).to have_content "Name can't be blank"
  end
end
