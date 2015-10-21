Fabricator :user do
  first_name Faker::Name.first_name
  last_name Faker::Name.last_name
  email Faker::Internet.email
  password CONFIG[:test_user_password]
  password_confirmation CONFIG[:test_user_password]
end