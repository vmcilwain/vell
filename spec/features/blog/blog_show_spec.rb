require 'rails_helper'

feature 'blog' do
  scenario 'view a blog ' do
    blog
    
    visit blogs_path
    click_link 'Read More'
    expect(page).to have_content blog.body
  end
end
