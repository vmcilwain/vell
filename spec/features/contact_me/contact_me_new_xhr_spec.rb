require 'rails_helper'

feature 'create contact me', js: true do
  scenario 'user successfully creates contact me via xhr' do
    visit root_path

    fill_in 'contact_me_name', with: 'John Rambo'
    fill_in 'contact_me_email', with: 'jrambo@example.com'
    fill_in 'contact_me_body', with: 'This is the body of a contact me'
    click_button 'Send Message'
    
    expect(page).to have_content "Your message has been sent."
    expect(page).to_not have_content 'John Rambo'
    expect(page).to_not have_content 'jrambo@example.com'
    expect(page).to_not have_content 'This is the body of a contact me'

    clear_mailbox
  end
end