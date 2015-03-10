require 'rails_helper'

feature 'add a comment to a blog', js: true do
  background do
    blog
  end
  
  scenario 'user adds a comment to a blog' do
    t = text(25)
    sign_in
    click_link 'Blogs'
    click_link blog.headline

    click_link 'Add Comment'
    fill_in 'blog_comment_name', with: Faker::Name.name
    fill_in 'blog_comment_body', with: t
    click_button 'Post'

    expect(page).to have_content t
  end
end