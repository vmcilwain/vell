require 'rails_helper'

feature 'create contact me with missing name', js: true do
  scenario 'user unsuccessfuly creates contact me via xhr' do
    visit root_path

    fill_in 'contact_me_email', with: 'jrambo@example.com'
    fill_in 'contact_me_body', with: 'This is the body of a contact me'
    click_button 'Send Message'
        
    expect(page).to have_content "There was a problem with your message."
    expect(page).to have_content "Name can't be blank"
  end
end