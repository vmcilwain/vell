require 'rails_helper'

feature 'edit blog comment' do
  background {blog_comment}
  scenario 'cancel editing a blog comment' do
    sign_in
    click_link 'Blog Comments'
    expect(page).to have_content blog_comment.body
    
    click_link 'Edit'
    expect(page).to have_link 'Cancel'
    
    click_link 'Cancel'
    expect(current_path).to eq blog_comment_path(blog_comment)
  end
end
