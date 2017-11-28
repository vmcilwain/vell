require 'rails_helper'

feature 'creating a project' do
  scenario 'a person can create a project if they have authenticated' do
    set_session admin_user
    visit new_project_path

    fill_in 'project_repo_url', with: Faker::Internet.url
    fill_in 'project_description', with: Faker::Lorem.words(5).join("\s")
    click_button 'Create Project'

    expect(page).to have_content 'Project saved'
  end
end
