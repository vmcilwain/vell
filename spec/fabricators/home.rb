Fabricator :home do
  index Faker::Lorem.words(25).join("\s")
  about Faker::Lorem.words(25).join("\s")
end