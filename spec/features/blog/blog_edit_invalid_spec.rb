require 'rails_helper'

feature 'blog' do
  scenario 'unsuccesful edit of a blog' do
    admin_user
    blog
    
    visit edit_blog_path(blog)
    sign_in_with(admin_user)
    
    fill_in_trix_editor("blog_body_trix_input_blog_#{blog.id}", '')
    click_button 'Update Blog'
    
    expect(page).to have_content "Body can't be blank"
  end
end
