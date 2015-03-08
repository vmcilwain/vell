require 'rails_helper'

feature 'photo', js: true do
  before {photo_album}
  after {delete_files}
  scenario 'valid photo creation' do
    visit photo_album_path(photo_album)
    expect(page).to have_content photo_album.name
    
    click_link 'Add Photo'
    attach_file('photo_document', "#{ATTACHMENT_ROOT}/test_picture.jpg")
    click_button 'Create Photo'
    
    expect(page).to have_content 'Photo created'
  end
end