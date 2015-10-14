Fabricator :user, class_name: 'SimpleAuthEngine::User' do
  full_name Faker::Name.name
  email Faker::Internet.email
  password 'P*ssw0rd'
  password_confirmation 'P*ssw0rd'
  security_question 'Whats your name?'
  security_answer 'Daffy Duck'
end