require 'rails_helper'

feature 'category' do
  scenario 'blog category should present error when invalid' do
    blog_category
    visit edit_blog_category_path(blog_category)
    sign_in_with(admin_user)
    
    fill_in 'blog_category_name', with: ''
    
    click_button 'Update Blog category'
    
    expect(page).to have_content "Name can't be blank"
  end
end
