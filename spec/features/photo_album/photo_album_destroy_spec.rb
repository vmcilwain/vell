require 'rails_helper'

feature 'photo albums' do
  background {photo_album}
  scenario 'destroying a photo album' do
    sign_in
    visit photo_album_path(photo_album)
    expect(page).to have_content photo_album.name
    
    click_link 'Destroy'
    expect(current_path).to eq photo_albums_path
    expect(page).to_not have_content photo_album.name
  end
end
