# require 'rails_helper'
#
# feature 'downloading a blog file' do
#   scenario 'user can download a file from file listing' do
#     blog_file
#     visit blog_files_path
#     expect(page).to have_link 'Download'
#     click_link 'Download'
#     expect(page.response_headers['Content-Type']).to eq('text/plain')
#   end
# end