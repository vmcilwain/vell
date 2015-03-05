# require 'rails_helper'
#
# feature 'photo', js: true do
#   background {photo}
#   after{delete_files}
#   scenario 'valid edit of a photo' do
#     visit photo_album_path(photo.photo_album)
#     within(".3u") do
#       click_link 'Edit'
#     end
#     fill_in 'photo_description', with: 'new description'
#     click_button 'Update Photo'
#     expect(page).to have_content 'new description'
#   end
# end