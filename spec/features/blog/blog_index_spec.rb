require 'rails_helper'

feature 'blog' do
  scenario 'view blog listing' do
    blog

    visit root_path

    click_link 'Blog'

    expect(page).to have_content 'Blogs'
  end
end
