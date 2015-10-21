require 'rails_helper'

feature 'blog category' do
  scenario 'cancelling a new blog category' do
    visit new_blog_category_path
    sign_in_with(admin_user)
    click_link 'Cancel'
    expect(current_path).to eq blog_categories_path
  end
end
