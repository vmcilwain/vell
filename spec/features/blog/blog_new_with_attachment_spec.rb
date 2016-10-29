require 'rails_helper'

feature 'blog', :vcr do
  after {delete_files}

  scenario 'creating a new blog with an attachment' do
    set_session admin_user
    visit new_blog_path
    attach_file('blog_blog_files_attributes_0_doc', web_test_file)
    fill_in 'blog_headline', with: Faker::Lorem.words(5).join("\s")
    fill_in_trix_editor("blog_body_trix_input_blog", text(20))
    click_button 'Create Blog'
    expect(page).to have_content 'Blog created!'
    expect(page).to have_link Blog.last.blog_files.last.doc_file_name
  end
end
