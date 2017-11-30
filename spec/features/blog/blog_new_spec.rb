require 'rails_helper'

feature 'blog' do
  scenario 'creating a new blog', js: true do
    set_session admin_user
    visit new_blog_path
    fill_in 'blog_headline', with: Faker::Lorem.word
    fill_in_trix_editor("#blog_body_trix_input_blog", Faker::Lorem.paragraph)
    click_button 'Create Blog'
    expect(page).to have_content 'Blog created!'
  end
end
