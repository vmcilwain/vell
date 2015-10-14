require 'rails_helper'

feature 'view blog comment index' do
  background {blog_comment}
  scenario 'view a listing of blog comments' do
    sign_in
    visit blog_comments_path
    expect(page).to have_content blog_comment.body
  end
end
