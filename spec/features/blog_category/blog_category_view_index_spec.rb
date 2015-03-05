require 'rails_helper'

feature 'viewing blog category index' do
  scenario 'view list of blog categories' do
    visit blog_categories_path    
    expect(page).to have_content 'Blog Categories'
  end
end