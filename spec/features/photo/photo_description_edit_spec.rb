require 'rails_helper'

feature 'photo', js: true do
  background {photo}
  after{delete_files}
  scenario 'valid edit of a photo' do
    visit photo_album_path(photo.photo_album)
    expect(page).to have_link "Edit Photo"
    
    click_link 'Edit Photo'
    fill_in 'photo_description', with: 'new description'
    click_button 'Update Photo'
    expect(page).to have_content 'new description'
  end
end