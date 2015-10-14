require 'rails_helper'

feature 'create contact me with missing body', js: true do
  scenario 'user unsuccessfuly creates contact me via xhr' do
    visit root_path
    page.all('a', text: 'Contact Me').last.click
    fill_in 'contact_me_name', with: 'John Rambo'
    fill_in 'contact_me_email', with: 'jrambo@example.com'
    click_button 'Send'
        
    expect(page).to have_content "There was a problem with your message."
    expect(page).to have_content "Body can't be blank"
  end
end