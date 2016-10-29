require 'rails_helper'

feature 'blog', :vcr do
  scenario 'creating a new blog' do
    set_session admin_user
    visit new_blog_path
    fill_in 'blog_headline', with: text
    fill_in_trix_editor("blog_body_trix_input_blog", text(20))
    click_button 'Create Blog'
    expect(page).to have_content 'Blog created!'
  end
end
