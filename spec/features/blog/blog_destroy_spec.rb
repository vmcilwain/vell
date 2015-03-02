require 'rails_helper'

feature 'destroy blog' do
  scenario 'deleting a blog', js: true do
    # blog
    # visit '/'
    # click_link 'Blogs'
    # click_link blog.headline
    # expect(page).to have_link 'Destroy'
    #
    # click_link 'Destroy'
    # js_ok
    # expect(page).to have_text 'Blog deleted!'
  end
end
