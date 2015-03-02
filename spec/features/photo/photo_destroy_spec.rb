require 'rails_helper'

feature 'photo' do
  background {photo}
  after {delete_files}
  
  scenario 'destroying a photo' do
    visit photo_album_path(photo.photo_album)
    expect(page).to have_link 'Destroy Photo'
    
    click_link 'Destroy Photo'
    expect(page).to have_content 'Photo destroyed'
  end
end