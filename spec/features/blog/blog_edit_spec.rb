require 'rails_helper'

feature 'blog' do
  scenario 'successful edit of a blog' do
    admin_user
    blog
    set_session admin_user
    visit edit_blog_path(blog)
    fill_in_trix_editor("blog_body_trix_input_blog_#{blog.id}", text(25))
    click_button 'Update Blog'
    expect(page).to have_content 'Blog updated!'

  end
end
