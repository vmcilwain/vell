require 'rails_helper'

feature 'photo albums' do
  background {photo_album}
  scenario 'successful update of a photo album' do
    visit photo_album_path(photo_album)
    expect(page).to have_content photo_album.name
    
    click_link 'Edit'
    fill_in 'photo_album_name', with: 'new album name'
    click_button 'Update Photo album'
    expect(page).to have_content 'Photo album updated'
  end
end