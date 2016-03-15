require 'rails_helper'

feature 'creating a project' do
  scenario 'an alert comes up when the description is missing' do
    visit root_path

    click_link 'Login'
    fill_in 'user_email', with: admin_user.email
    fill_in 'user_password', with: 'somepassword'
    click_button 'Log in'

    click_link 'Projects'
    click_link 'New Project'

    fill_in 'project_repo_url', with: Faker::Internet.url
    click_button 'Create Project'

    expect(page).to have_content "Description can't be blank"
  end
end
