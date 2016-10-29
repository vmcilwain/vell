require 'rails_helper'

feature 'create contact me with missing body' do
  scenario 'user unsuccessfuly creates contact me via http' do
    visit root_path
    click_link 'Contact'
    within '#new_contact_me', match: :first do
      fill_in 'contact_me_name', with: 'John Rambo'
      fill_in 'contact_me_body', with: 'This is the body of a contact me'
      click_button 'Send'
    end

    expect(page).to have_content "Email can't be blank"
  end
end
