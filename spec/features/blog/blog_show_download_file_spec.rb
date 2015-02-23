require 'rails_helper'

feature 'viewing blogs index', :vcr do
  scenario 'view blog listing' do
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
    blog_file = Blog.last.blog_files.first
    expect(page).to have_link blog_file.blog_document.filename
    
    click_link blog_file.blog_document.file.identifier
    expect(page.response_headers['Content-Type']).to eq('text/plain')
  end
end