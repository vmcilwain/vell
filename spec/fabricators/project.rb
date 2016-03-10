Fabricator :project do
  repo_url Faker::Internet.url
  live_url Faker::Internet.url
  description Faker::Lorem.paragraphs(1).first
end
