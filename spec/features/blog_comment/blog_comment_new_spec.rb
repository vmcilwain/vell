require 'rails_helper'

feature 'new blog comment' do
  scenario 'creating a new blog comment' do
    visit blog_path(blog)
    
    fill_in 'comment-name', with: Faker::Name.name
    fill_in 'comment-body', with: text(25)
    click_button 'Post'
    expect(page).to have_content 'Comment added'
  end
end
