require 'rails_helper'

feature 'cancel creating a new blog category' do
  scenario 'cancelling a new blog category' do
    sign_in
    click_link 'Blog Categories'
    click_link 'New Category'

    expect(page).to have_content 'Create Blog Category'

    click_link 'Cancel'
    expect(current_path).to eq blog_categories_path
  end
end
