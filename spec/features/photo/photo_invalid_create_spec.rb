require 'rails_helper'

feature 'photo', js: true do
  before {photo_album}
  after {delete_files}
  scenario 'valid photo creation' do
    visit photo_album_path(photo_album)
    expect(page).to have_content photo_album.name
    
    click_link 'Add Photo'
    click_button 'Create Photo'
    expect(page).to have_content "Document can't be blank"
  end
end