require 'rails_helper'

feature 'viewing contact me' do
  scenario "user views a contact me" do
    contact_me = Fabricate(:contact_me, name: 'John Rambo', email: 'jrambo@example.com', body: "this is a new contact me!")
    set_session admin_user

    visit contact_mes_path
    
    click_link contact_me.name

    expect(page).to have_text "this is a new contact me!"

    clear_mailbox
  end
end
