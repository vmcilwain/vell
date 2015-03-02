Fabricator :photo_comment do
  photo
  name Faker::Name.name
  headline Faker::Lorem.words(5).join("\s")
  body Faker::Lorem.words(25).join("\s")
end