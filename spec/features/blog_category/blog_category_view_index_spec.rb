require 'rails_helper'

feature 'blog category' do
  scenario 'view list of blog categories' do
    visit blog_categories_path
    sign_in_with(admin_user)
    expect(page).to have_content 'Blog Categories'
  end
end
