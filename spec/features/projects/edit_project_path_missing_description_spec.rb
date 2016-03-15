require 'rails_helper'

feature 'creating a project' do
  scenario 'an alert is set when description is removed' do
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
    fill_in 'project_description', with: ''
    click_button 'Update Project'

    expect(page).to have_content "Description can't be blank"
  end
end
