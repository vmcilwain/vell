Fabricator :blog do
  headline Faker::Lorem.words(5).join("\s")
  body Faker::Lorem.words(25).join("\s")
end