# Can't get modal box click to work
# require 'rails_helper'
#
# feature 'photo', js: true do
#   background {photo}
#   after {delete_files}
#
#   scenario 'destroying a photo' do
#     visit photo_album_path(photo.photo_album)
#       click_link page.all('a', text: 'Destroy').last.click
#       alert = wait.until { page.driver.browser.switch_to.alert }
#       alert.accept
#     expect(page).to have_content 'Photo destroyed'
#   end
# end