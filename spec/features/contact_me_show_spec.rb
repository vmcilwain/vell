require 'rails_helper'

feature 'viewing contact me' do
  scenario "user views a contact me" do
    contact_me = Fabricate(:contact_me, name: 'John Rambo', email: 'jrambo@example.com', body: "this is a new contact me!")
    
    visit contact_mes_path
    expect(page).to have_link contact_me.id
    
    click_link contact_me.id
    expect(page).to have_text "this is a new contact me!"
  end
end