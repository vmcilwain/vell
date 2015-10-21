require 'rails_helper'

feature 'edit blog comment' do
  scenario 'editing a blog comment' do
    visit blog_comment_path(blog_comment)
    sign_in_with(admin_user)
    
    click_link 'Edit'
    fill_in 'blog_comment_name', with: Faker::Name.name
    fill_in 'blog_comment_body', with: text(25)
    click_button 'Update'
    expect(page).to have_content 'Blog comment updated'
  end
end
