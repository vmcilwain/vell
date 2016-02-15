require 'rails_helper'

feature 'blog' do
  scenario 'cancel a new blog' do
    admin_user
    
    visit new_blog_path
    sign_in_with(admin_user)
    click_link 'Cancel'

    expect(current_path).to eq blogs_path
  end
end
