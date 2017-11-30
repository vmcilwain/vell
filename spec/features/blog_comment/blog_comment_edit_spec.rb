require 'rails_helper'

feature 'edit blog comment' do
  scenario 'editing a blog comment' do
    set_session admin_user
    visit blog_comment_path(blog_comment)
    click_link 'Edit'
    fill_in 'blog_comment_name', with: Faker::Name.name
    fill_in_trix_editor("#blog_comment_body_trix_input_blog_comment_#{blog_comment.id}", text(20))
    click_button 'Update'
    expect(page).to have_content 'Blog comment updated'
  end
end
