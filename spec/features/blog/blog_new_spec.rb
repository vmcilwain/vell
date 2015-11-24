require 'rails_helper'

feature 'blog', :vcr do
  scenario 'creating a new blog' do
    blog_category
    visit new_blog_path
    sign_in_with(admin_user)
    
    fill_in 'blog_headline', with: text
    fill_in 'blog_body', with: text(20)
    click_button 'Create Blog'
    
    expect(page).to have_content 'Blog created!'
  end
end
