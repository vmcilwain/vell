require 'rails_helper'

feature 'new blog', :vcr do
  scenario 'creating a new blog with an attachment' do
    blog_category
     
    visit "/"
    click_link 'Blogs'
    expect(page).to have_link 'New Blog'
    
    click_link 'New Blog'
    expect(page).to have_content 'Create Blog'
    
    attach_file('blog_blog_files_attributes_0_blog_document', web_test_file)
    select blog_category.name, from: 'blog_blog_category_id'
    fill_in 'blog_headline', with: text
    fill_in 'blog_body', with: text(20)
    click_button 'Create Blog'
    
    expect(page).to have_content 'Blog created!'
    expect(page).to have_link Blog.last.blog_files.first.blog_document.filename
  end
end