require 'rails_helper'

feature 'new blog', :vcr do

  after {delete_files}
  scenario 'creating a new blog with an attachment' do
    blog_category
     
    sign_in
    click_link 'Blogs'
    expect(page).to have_link 'New Blog'
    
    click_link 'New Blog'
    expect(page).to have_content 'Create Blog'
    
    attach_file('blog_blog_files_attributes_0_doc', web_test_file)
    select blog_category.name, from: 'blog_blog_category_id'
    fill_in 'blog_headline', with: Faker::Lorem.words(5).join("\s")
    fill_in 'blog_body', with: Faker::Lorem.words(25).join("\s")
    click_button 'Create Blog'

    expect(page).to have_content 'Blog created!'
    expect(page).to have_link Blog.last.blog_files.last.doc_file_name
  end
end
