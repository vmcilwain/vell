require 'rails_helper'

feature 'create contact me with missing name' do
  scenario 'user unsuccessfuly creates contact me via http' do
    visit root_path
    page.all('a', text: 'Contact Me').last.click
    fill_in 'contact_me_email', with: 'jrambo@example.com'
    fill_in 'contact_me_body', with: 'This is the body of a contact me'
    click_button 'Send'
        
    expect(page).to have_content "There was a problem with your message."
    expect(page).to have_content "Name can't be blank"
  end
end