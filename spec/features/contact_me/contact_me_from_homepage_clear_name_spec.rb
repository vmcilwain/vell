require 'rails_helper'

feature 'contact me', js: true do
  scenario 'name field should clear after successful submition' do
    name = Faker::Name.name
    visit root_path

    fill_in 'contact_me_name', with: name
    fill_in 'contact_me_email', with: Faker::Internet.email
    fill_in 'contact_me_body', with: Faker::Lorem.paragraphs(1).first
    click_button 'Send'

    expect(page).to_not have_content name

    clear_mailbox
  end
end
