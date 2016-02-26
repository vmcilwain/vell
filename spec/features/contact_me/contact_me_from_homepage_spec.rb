require 'rails_helper'

feature 'contact me', js: true do
  scenario 'Anyone can write a contact me from the home page' do
    visit root_path

    fill_in 'contact_me_name', with: Faker::Name.name
    fill_in 'contact_me_email', with: Faker::Internet.email
    fill_in 'contact_me_body', with: Faker::Lorem.paragraphs(1).first
    click_button 'Send'
    
    expect(page).to have_content "Your message has been sent."

    clear_mailbox
  end
end
