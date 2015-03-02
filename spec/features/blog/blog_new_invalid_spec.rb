require 'rails_helper'

feature 'new blog' do
  scenario 'creating an invalid blog' do
    blog_category
     
    visit "/"
    click_link 'Blogs'
    expect(page).to have_link 'New Blog'
    
    click_link 'New Blog'
    expect(page).to have_content 'Create Blog'
    
    select blog_category.name, from: 'blog_blog_category_id'
    fill_in 'blog_body', with: text(20)
    click_button 'Create Blog'
    expect(page).to have_content "Headline can't be blank"
  end
end