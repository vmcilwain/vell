require 'rails_helper'

feature 'blog' do
  scenario 'creating an invalid blog' do
    blog_category
    visit new_blog_path
    sign_in_with(admin_user)
    select blog_category.name, from: 'blog_blog_category_id'
    fill_in 'blog_body', with: text(20)
    click_button 'Create Blog'
    expect(page).to have_content "Headline can't be blank"
  end
end
