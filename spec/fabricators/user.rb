Fabricator :user, class_name: 'Authenticatable::User' do
  full_name Faker::Name.name
  email Faker::Internet.email
  password 'P*ssw0rd'
end