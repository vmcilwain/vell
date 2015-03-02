require 'rails_helper'

feature 'photo albums' do
  scenario 'create a valid photo album' do
    visit photo_albums_path
    expect(page).to have_text 'Photo Albums'
    
    click_link 'New Album'
    fill_in 'photo_album_name', with: Faker::Lorem.words(1).first
    fill_in 'photo_album_description', with: Faker::Lorem.words(5).join("\s")
    click_button 'Create Photo album'
    expect(page).to have_content 'Photo album created'
  end
end
