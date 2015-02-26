require 'rails_helper'

feature 'new blog comment' do
  background {blog}
  scenario 'creating a new blog comment' do
    visit new_blog_comment_path(blog_id: blog.id)
    expect(page).to have_content 'New Blog Comment'
    
    fill_in 'blog_comment_name', with: Faker::Name.name
    fill_in 'blog_comment_body', with: text(25)
    click_button 'Create'
    expect(page).to have_content 'Blog comment created'
  end
end