require 'rails_helper'

feature 'blog file index' do
  after {delete_files}
  scenario 'viewing blog file index' do
    blog_file1 = Fabricate :blog_file
    set_session admin_user
    visit blog_files_path
    expect(page).to have_link 'test_file.txt'
  end
end
