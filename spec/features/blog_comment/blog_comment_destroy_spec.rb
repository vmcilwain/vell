require 'rails_helper'

feature 'destroying a blog comment' do
  background {blog_comment}
  scenario 'removing a blog comment' do
    set_session admin_user
    visit blog_comments_path
    expect(page).to have_content blog_comment.body
    click_link 'Destroy'
    expect(page).to have_content 'Blog comment destroyed'
  end
end
