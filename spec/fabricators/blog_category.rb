Fabricator :blog_category do
  name Faker::Lorem.words(50).shuffle.sample(1).first
end