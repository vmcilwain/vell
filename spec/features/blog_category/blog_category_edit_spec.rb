require 'rails_helper'

feature 'blog category' do
  scenario 'being able to edit a blog category' do
    blog_category
    visit edit_blog_category_path(blog_category)
    sign_in_with(admin_user)
    fill_in 'blog_category_name', with: 'Ruby'
    click_button 'Update Blog category'

    expect(page).to have_content 'Blog Category Updated!'
  end
end
