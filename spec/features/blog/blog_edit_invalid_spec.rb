require 'rails_helper'

feature 'edit blog' do
  scenario 'unsuccesful edit of a blog' do
    blog
     
    sign_in
    click_link 'Blog'
    click_link blog.headline
    click_link 'Edit'
    fill_in 'blog_body', with: ''
    click_button 'Update Blog'
    expect(page).to have_content "Body can't be blank"
    
  end
end
