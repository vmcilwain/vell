require 'rails_helper'

feature 'blog file index' do
  after {delete_files}
  scenario 'viewing blog file index' do
    blog_file1 = Fabricate :blog_file
    blog_file2 = Fabricate :blog_file
    visit blog_files_path
    
    expect(page).to have_css "div#blog_file_#{blog_file1.id}"
    expect(page).to have_css "div#blog_file_#{blog_file2.id}"
  end
end