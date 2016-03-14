require 'rails_helper'

feature 'projects index' do
  scenario 'a person can not view live_url from projects index if not specified' do
    project
    
    visit root_path
    click_link 'Projects'

    expect(page).to_not have_link 'Live'
  end
end
