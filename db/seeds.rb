# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts "Start!"
User.create(email: 'admin@example.com', password: 'somepassword', password_confirmation: 'somepassword', admin: true)
5.times {ContactMe.create(name: Faker::Name.name, email: Faker::Internet.email, body: Faker::Lorem.words(50).join("\s"))}
5.times {Blog.create(headline: Faker::Lorem.words(5).join("\s"), body: Faker::Lorem.words(50).join("\s"))}
Blog.all do |blog|
  5.times {BlogComment.create(blog_id: blog.id, name: Faker::Name.name, body: Faker::Lorem.words(50).join("\s"))}
end
5.times {Project.create(repo_url: Faker::Internet.url, live_url: Faker::Internet.url, description: Faker::Lorem.paragraph)}
puts "tratS!"
