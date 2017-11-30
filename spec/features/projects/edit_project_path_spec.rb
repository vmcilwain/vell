require 'rails_helper'

feature 'creating a project' do
  scenario 'a person can edit a project if they have authenticated' do
    project
    set_session admin_user
    visit edit_project_path(project)

    fill_in 'project_repo_url', with: Faker::Internet.url
    fill_in 'project_description', with: Faker::Lorem.words(5).join("\s")
    click_button 'Update Project'
    
    expect(page).to have_content 'Project updated'
  end
end
