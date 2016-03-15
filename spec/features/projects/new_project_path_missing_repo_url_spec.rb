require 'rails_helper'

feature 'creating a project' do
  scenario 'an alert comes up when a repo url is missing' do
    visit root_path

    click_link 'Login'
    fill_in 'user_email', with: admin_user.email
    fill_in 'user_password', with: 'somepassword'
    click_button 'Log in'

    click_link 'Projects'
    click_link 'New Project'

    fill_in 'project_description', with: Faker::Lorem.words(5).join("\s")
    click_button 'Create Project'

    expect(page).to have_content "Repo url can't be blank"
  end
end
