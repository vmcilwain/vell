require 'rails_helper'

feature 'blog', :vcr do
  after {delete_files}
  
  scenario 'creating a new blog with an attachment' do
    blog_category
    visit new_blog_path
    sign_in_with(admin_user)
    attach_file('blog_blog_files_attributes_0_doc', web_test_file)
    select blog_category.name, from: 'blog_blog_category_id'
    fill_in 'blog_headline', with: Faker::Lorem.words(5).join("\s")
    fill_in 'blog_body', with: Faker::Lorem.words(25).join("\s")
    click_button 'Create Blog'

    expect(page).to have_content 'Blog created!'
    expect(page).to have_link Blog.last.blog_files.last.doc_file_name
  end
end
