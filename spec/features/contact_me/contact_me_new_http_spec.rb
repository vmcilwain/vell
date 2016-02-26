require 'rails_helper'

feature 'create contact me' do
  scenario 'user successfully creates contact me via http' do
    visit root_path
    click_link 'Contact'
    within '.well' do
      fill_in 'contact_me_name', with: 'John Rambo'
      fill_in 'contact_me_email', with: 'jrambo@example.com'
      fill_in 'contact_me_body', with: 'This is the body of a contact me'
      click_button 'Send'
    end

    expect(page).to have_content "Your message has been sent."

    clear_mailbox
  end
end
