require 'rails_helper'

feature 'blog file index' do
  before {blog_file}
  after {delete_files}
  scenario 'viewing blog file index' do
    visit blog_files_path
    sign_in_with(admin_user)
    expect(page).to have_link 'Delete'

    click_link 'Delete'
    expect(page).to_not have_content blog_file.doc_file_name
  end
end
