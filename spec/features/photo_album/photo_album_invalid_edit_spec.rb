require 'rails_helper'

feature 'photo albums' do
  background {photo_album}
  scenario 'unsuccessful update of a photo album' do
    sign_in
    click_link 'Photo Albums'
    click_link photo_album.name
    expect(page).to have_content photo_album.name
    
    click_link 'Edit'
    fill_in 'photo_album_name', with: 'new album name'
    click_button 'Update Photo album'
    expect(page).to have_content 'Photo album updated'
  end
end
