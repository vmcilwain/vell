require 'rails_helper'

feature 'edit blog' do
  scenario 'successful edit of a blog' do
    blog
     
    sign_in
    click_link 'Blogs'
    click_link blog.headline
    click_link 'Edit'
    fill_in 'blog_body', with: text(25)
    click_button 'Update Blog'
    expect(page).to have_content 'Blog updated!'
    
  end
end
