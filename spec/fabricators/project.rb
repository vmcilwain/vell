Fabricator :project do
  repo_url Faker::Internet.url
  description Faker::Lorem.words(10).join("\s")
end
