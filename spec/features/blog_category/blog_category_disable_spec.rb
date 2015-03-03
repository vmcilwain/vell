require 'rails_helper'

feature 'blog category' do
  before {blog_category}
  scenario 'disable a blog category' do
    visit blog_categories_path

    click_link 'Edit'
    uncheck 'blog_category_enabled'
    click_button 'Update Blog category'
    expect(page).to have_text 'Enabled: false'
  end
end