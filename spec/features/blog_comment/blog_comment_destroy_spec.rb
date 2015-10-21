require 'rails_helper'

feature 'destroying a blog comment' do
  background {blog_comment}
  scenario 'removing a blog comment' do
    visit blog_comments_path
    sign_in_with(admin_user)
    expect(page).to have_content blog_comment.body
    
    click_link 'Destroy'
    expect(page).to have_content 'Blog comment destroyed'
  end
end
