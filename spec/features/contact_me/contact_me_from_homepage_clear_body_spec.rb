require 'rails_helper'

feature 'contact me', js: true do
  scenario 'body field should clear after successful submition' do
    body = Faker::Lorem.paragraphs(1).first
    visit root_path

    fill_in 'contact_me_name', with: Faker::Name.name
    fill_in 'contact_me_email', with: Faker::Internet.email
    fill_in 'contact_me_body', with: body
    click_button 'Send'

    expect(page).to_not have_content body

    clear_mailbox
  end
end
