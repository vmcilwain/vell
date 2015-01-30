require 'rails_helper'

feature 'cancel blog category edit' do
  scenario 'cancelling a blog category in edit mode' do
    blog_category = Fabricate :blog_category

    visit blog_categories_path

    expect(page).to have_link blog_category.name

    click_link 'Edit'
    click_link 'Cancel'

    expect(current_path).to eq blog_category_path(blog_category)

  end
end
