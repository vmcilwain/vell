require 'rails_helper'

feature 'creating a project' do
  scenario 'a person can view a project without authentication' do
    project

    visit root_path

    click_link 'Projects'
    click_link project.id

    expect(page).to have_link project.repo_url
  end
end
