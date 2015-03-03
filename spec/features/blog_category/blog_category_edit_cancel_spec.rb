require 'rails_helper'

feature 'cancel blog category edit' do
  background {blog_category}
  scenario 'cancelling a blog category in edit mode' do
    visit blog_categories_path
    expect(page).to have_link 'Edit'
    click_link 'Cancel'

    expect(current_path).to eq blog_categories_path

  end
end
