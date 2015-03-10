def add_user_to_role(user, role)
  Authenticatable::Role.find_or_create_by(name: role).users << user
end