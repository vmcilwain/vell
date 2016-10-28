require 'rails_helper'

feature 'projects index' do
  scenario 'a person can view live_url from projects index' do
    project = Fabricate :project, live_url: Faker::Internet.url

    visit project_path(project)
    
    expect(page).to have_link project.live_url
  end
end
