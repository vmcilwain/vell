require 'rails_helper'

feature 'blog file index' do
  after {delete_files}
  scenario 'viewing blog file index' do
    blog_file1 = Fabricate :blog_file
    blog_file2 = Fabricate :blog_file
    visit blog_files_path

    expect(page.all('a', text: 'test_file.txt').size).to eq 2
  end
end