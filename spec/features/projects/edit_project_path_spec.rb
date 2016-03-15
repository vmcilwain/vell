require 'rails_helper'

feature 'creating a project' do
  scenario 'a person can edit a project if they have authenticated' do
    project

    visit root_path

    click_link 'Login'
    fill_in 'user_email', with: admin_user.email
    fill_in 'user_password', with: 'somepassword'
    click_button 'Log in'

    click_link 'Projects'
    click_link project.id

    click_link 'Edit'

    fill_in 'project_repo_url', with: Faker::Internet.url
    fill_in 'project_description', with: Faker::Lorem.words(5).join("\s")
    click_button 'Update Project'

    expect(page).to have_content 'Project updated'
  end
end
