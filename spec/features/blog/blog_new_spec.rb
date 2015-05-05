require 'rails_helper'

feature 'new blog', :vcr do
  scenario 'creating a new blog' do
    blog_category
     
    sign_in
    click_link 'Blog'
    expect(page).to have_link 'New Blog'
    
    click_link 'New Blog'
    expect(page).to have_content 'Create Blog'
    
    select blog_category.name, from: 'blog_blog_category_id'
    fill_in 'blog_headline', with: text
    fill_in 'blog_body', with: text(20)
    click_button 'Create Blog'
    
    expect(page).to have_content 'Blog created!'
  end
end
