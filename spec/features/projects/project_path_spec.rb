require 'rails_helper'

feature 'creating a project' do
  scenario 'a person can view a project without authentication' do
    project

    visit project_path(project)

    expect(page).to have_link project.repo_url
  end
end
