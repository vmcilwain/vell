RSpec.configure do |config|
  config.include Devise::TestHelpers, :type => :controller
end

def sign_in_with(user=user)
  fill_in 'user_email', with: user.email
  fill_in 'user_password', with: CONFIG[:test_user_password]
  click_button 'Log in'
end