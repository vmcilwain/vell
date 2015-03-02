require 'rails_helper'

feature 'edit blog' do
  scenario 'canceling a blog edit' do
    blog
     
    visit "/"
    click_link 'Blogs'    
    click_link blog.headline    
    click_link 'Edit'
    click_link 'Cancel'
    expect(current_path).to eq blogs_path
    
  end
end
