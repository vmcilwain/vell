require 'rails_helper'

feature 'edit blog comment' do
  background {blog_comment}
  scenario 'editing a blog comment' do
    sign_in
    click_link 'Blog Comments'
    expect(page).to have_content blog_comment.body
    
    click_link 'Edit'
    fill_in 'blog_comment_name', with: Faker::Name.name
    fill_in 'blog_comment_body', with: text(25)
    click_button 'Update'
    expect(page).to have_content 'Blog comment updated'
  end
end
