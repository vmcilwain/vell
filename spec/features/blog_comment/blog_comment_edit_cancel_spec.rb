require 'rails_helper'

feature 'edit blog comment' do
  background {blog_comment}
  scenario 'cancel editing a blog comment' do
    visit blog_comments_path
    expect(page).to have_content blog_comment.body
    
    click_link 'Edit'
    expect(page).to have_link 'Cancel'
    
    click_link 'Cancel'
    expect(current_path).to eq blog_comment_path(blog_comment)
  end
end