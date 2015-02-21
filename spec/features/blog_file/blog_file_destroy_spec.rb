require 'rails_helper'

feature 'blog file index' do
  scenario 'viewing blog file index' do
    blog_file = Fabricate :blog_file

    visit blog_files_path
    expect(page).to have_link 'Delete'
    
    click_link 'Delete'
    expect(page).to_not have_content blog_file.blog_document.filename
  end
end