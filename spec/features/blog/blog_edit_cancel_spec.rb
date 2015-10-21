require 'rails_helper'

feature 'blog' do
  scenario 'canceling a blog edit' do
    blog
    admin_user
    visit edit_blog_path(blog)
        
    sign_in_with(admin_user)
    
    click_link 'Cancel'
    
    expect(current_path).to eq blog_path(blog)
  end
end
