require 'rails_helper'

feature 'view blog comment index' do
  background do
    blog_comment
  end
  scenario 'view a listing of blog comments' do
    visit blog_comments_path
    sign_in_with(admin_user)
    expect(page).to have_content blog_comment.blog.headline
  end
end
