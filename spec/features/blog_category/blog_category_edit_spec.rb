require 'rails_helper'

feature 'editing a blog category' do
  scenario 'being able to edit a blog category' do
    blog_category

    sign_in
    click_link 'Blog Categories'

    expect(page).to have_content blog_category.name

    click_link 'Edit'
    fill_in 'blog_category_name', with: 'Ruby'
    click_button 'Update Blog category'

    expect(page).to have_content 'Blog Category Updated!'
  end
end
