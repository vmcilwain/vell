require 'rails_helper'

feature 'photo albums' do
  scenario 'creating an invalid photo album' do
    sign_in
    click_link 'Photo Albums'
    expect(page).to have_text 'Photo Albums'
    
    click_link 'New Album'
    fill_in 'photo_album_name', with: nil
    fill_in 'photo_album_description', with: Faker::Lorem.words(5).join("\s")
    click_button 'Create Photo album'
    expect(page).to have_content "Name can't be blank"
  end
end
