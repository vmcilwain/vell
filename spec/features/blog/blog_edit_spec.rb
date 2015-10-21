require 'rails_helper'

feature 'blog' do
  scenario 'successful edit of a blog' do
    admin_user
    blog
    visit edit_blog_path(blog)
    sign_in_with(admin_user)
    fill_in 'blog_body', with: text(25)
    click_button 'Update Blog'
    expect(page).to have_content 'Blog updated!'
    
  end
end
