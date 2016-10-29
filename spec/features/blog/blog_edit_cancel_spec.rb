require 'rails_helper'

feature 'blog' do
  scenario 'canceling a blog edit' do
    blog
    admin_user
    set_session admin_user
    visit edit_blog_path(blog)
    click_link 'Cancel'
    expect(current_path).to eq blog_path(blog)
  end
end
