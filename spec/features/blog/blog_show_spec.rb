require 'rails_helper'

feature 'viewing blogs index' do
  scenario 'view blog listing' do
    blog
    
    visit "/"
    click_link 'Blog'
    expect(page).to have_link blog.headline
    
    click_link blog.headline
    
    expect(page).to have_content blog.body
  end
end