require 'rails_helper'

feature 'projects index' do
  scenario 'a person can view live_url from projects index' do
    project = Fabricate :project, live_url: Faker::Internet.url
    
    visit root_path
    click_link 'Projects'

    expect(page).to have_link 'Live'
  end
end
