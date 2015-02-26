require 'rails_helper'

feature 'blog file index' do
  after {delete_files}
  scenario 'viewing blog file index' do
    blog_file1 = Fabricate :blog_file
    blog_file2 = Fabricate :blog_file
    visit blog_files_path
    expect(page).to have_content 'Blog File Listing'
    expect(page).to have_content blog_file1.doc_file_name
    expect(page).to have_content blog_file2.description
  end
end