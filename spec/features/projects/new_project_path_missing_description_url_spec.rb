require 'rails_helper'

feature 'creating a project' do
  scenario 'an alert comes up when the description is missing' do
    set_session admin_user
    visit new_project_path
    fill_in 'project_repo_url', with: Faker::Internet.url
    click_button 'Create Project'

    expect(page).to have_content "Description can't be blank"
  end
end
