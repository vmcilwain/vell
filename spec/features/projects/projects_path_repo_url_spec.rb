require 'rails_helper'

feature 'projects index' do
  scenario 'a person can view repo_url from projects index' do
    project

    visit projects_path(project)

    expect(page).to have_link project.repo_url
  end
end
