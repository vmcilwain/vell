require 'rails_helper'

feature 'blog' do
  scenario 'creating an invalid blog' do
    set_session admin_user
    visit new_blog_path
    fill_in_trix_editor("blog_body_trix_input_blog", text(20))
    click_button 'Create Blog'
    expect(page).to have_content "Headline can't be blank"
  end
end
