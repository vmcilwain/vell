require 'rails_helper'

feature 'blog' do
  scenario 'view blog listing' do
    blog

    visit root_path
    click_link 'Articles', match: :first

    expect(current_path).to eq blogs_path
  end
end
