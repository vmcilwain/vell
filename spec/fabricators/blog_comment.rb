Fabricator :blog_comment do
  blog
  name Faker::Name.name
  body Faker::Lorem.words(25).join("\s")
end