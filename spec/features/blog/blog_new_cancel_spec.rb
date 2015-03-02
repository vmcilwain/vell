require 'rails_helper'

feature 'new blog' do
  scenario 'cancel a new blog' do
    blog_category
     
    visit "/"
    click_link 'Blogs'
    expect(page).to have_link 'New Blog'
    
    click_link 'New Blog'
    expect(page).to have_content 'Create Blog'
    
    click_link 'Cancel'
    
    expect(current_path).to eq blogs_path
  end
end