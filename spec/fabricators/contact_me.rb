Fabricator :contact_me do
  name Faker::Name.name
  email Faker::Internet.email
  body Faker::Lorem.words(50).join("\s")
end