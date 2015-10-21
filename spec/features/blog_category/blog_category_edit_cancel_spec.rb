require 'rails_helper'

feature 'blog category' do
  background {blog_category}
  scenario 'cancelling a blog category in edit mode' do
    visit blog_categories_path

    sign_in_with(admin_user)
    
    click_link 'Edit'
    
    click_link 'Cancel'

    expect(current_path).to eq blog_categories_path

  end
end
