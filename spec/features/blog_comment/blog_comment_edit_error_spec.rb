require 'rails_helper'

feature 'edit blog comment' do
  background {blog_comment}
  scenario 'invalid editing a blog comment' do
    visit blog_comment_path(blog_comment)
    sign_in_with(admin_user)
    
    click_link 'Edit'
    fill_in 'blog_comment_name', with: nil
    fill_in 'blog_comment_body', with: text(25)
    click_button 'Update'
    expect(page).to have_content "Name can't be blank"
  end
end
