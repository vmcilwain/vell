require 'rails_helper'

feature 'blog file index' do
  before {blog_file}
  after {delete_files}
  scenario 'viewing blog file index' do
    set_session admin_user
    visit blog_files_path
    click_link 'Delete'
    expect(page).to_not have_content blog_file.doc_file_name
  end
end
