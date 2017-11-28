require 'rails_helper'

feature 'creating a project' do
  scenario 'an alert comes up when a repo url is missing' do
    set_session admin_user
    visit new_project_path
    fill_in 'project_description', with: Faker::Lorem.words(5).join("\s")
    click_button 'Create Project'

    expect(page).to have_content "Repo url can't be blank"
  end
end
