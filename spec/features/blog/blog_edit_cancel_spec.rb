require 'rails_helper'

feature 'edit blog' do
  scenario 'canceling a blog edit' do
    blog
     
    sign_in
    click_link 'Blog'
    click_link blog.headline
    click_link 'Edit'
    click_link 'Cancel'
    expect(current_path).to eq blog_path(blog)
    
  end
end
