require 'rails_helper'

feature 'contact me', js: true do
  scenario 'email field should clear after successful submition' do
    email = Faker::Internet.email
    visit root_path

    fill_in 'contact_me_name', with: Faker::Name.name
    fill_in 'contact_me_email', with: email
    fill_in 'contact_me_body', with: Faker::Lorem.paragraphs(1).first
    click_button 'Send'

    expect(page).to_not have_content email

    clear_mailbox
  end
end
