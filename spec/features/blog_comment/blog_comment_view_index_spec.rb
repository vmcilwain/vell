require 'rails_helper'

feature 'view blog comment index' do
  scenario 'view a listing of blog comments' do
    blog_comment
    set_session admin_user
    visit blog_comments_path
    expect(page).to have_content blog_comment.blog.headline
  end
end
