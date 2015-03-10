require 'rails_helper'

feature 'new blog comment' do
  background {blog}
  scenario 'cancelling a new blog comment' do
    sign_in
    visit new_blog_comment_path(blog_id: blog.id)
    expect(page).to have_content 'New Blog Comment'
    click_link 'Cancel'
    expect(current_path).to eq blog_comments_path
  end
end
