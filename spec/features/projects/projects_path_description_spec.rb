require 'rails_helper'

feature 'projects index' do
  scenario 'a person can view description from projects index' do
    project

    visit root_path
    click_link 'Projects'

    expect(page).to have_content project.description
  end
end
