require 'rails_helper'

feature 'blog' do
  scenario 'cancel a new blog' do
    admin_user
    set_session admin_user
    visit new_blog_path
    click_link 'Cancel'
    expect(current_path).to eq blogs_path
  end
end
