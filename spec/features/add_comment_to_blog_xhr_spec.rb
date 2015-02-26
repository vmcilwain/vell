require 'rails_helper'

feature 'add a comment to a blog', js: true do
  background do
    blog
  end
  
  scenario 'user adds a comment to a blog' do
    visit blog_path(blog)

    click_link 'Add Comment'
    fill_in 'blog_comment_name', with: Faker::Name.name
    fill_in 'blog_comment_body', with: text(25)
    click_button 'Post'

    expect(page).to have_content text
  end
end