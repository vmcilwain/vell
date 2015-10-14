def add_user_to_role(user, role)
  SimpleAuthEngine::Role.find_or_create_by(name: role).users << user
end

def sign_in
   add_user_to_role(user, 'administrator')
   visit root_path
   click_link 'Sign In'
   fill_in :email, with: user.email
   fill_in :password, with: 'P*ssw0rd'
   click_button 'Login'
end
