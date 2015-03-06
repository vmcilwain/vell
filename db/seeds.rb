# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
ContactMe.create([{name: Faker::Name.name, email: Faker::Internet.email, body: Faker::Lorem.words(50).join("\s")},
                  {name: Faker::Name.name, email: Faker::Internet.email, body: Faker::Lorem.words(50).join("\s")},
                  {name: Faker::Name.name, email: Faker::Internet.email, body: Faker::Lorem.words(50).join("\s")},
                  {name: Faker::Name.name, email: Faker::Internet.email, body: Faker::Lorem.words(50).join("\s")},
                  {name: Faker::Name.name, email: Faker::Internet.email, body: Faker::Lorem.words(50).join("\s")}])
                  
blog_categories = BlogCategory.create([{name: Faker::Lorem.words(1).first},
                                       {name: Faker::Lorem.words(1).first},
                                       {name: Faker::Lorem.words(1).first},
                                       {name: Faker::Lorem.words(1).first},
                                       {name: Faker::Lorem.words(1).first}])

Blog.create([{blog_category_id: blog_categories.shuffle.sample(1).first.id, headline: Faker::Lorem.words(5).join("\s"), body: Faker::Lorem.words(50).join("\s")},
                     {blog_category_id: blog_categories.shuffle.sample(1).first.id, headline: Faker::Lorem.words(5).join("\s"), body: Faker::Lorem.words(50).join("\s")},
                     {blog_category_id: blog_categories.shuffle.sample(1).first.id, headline: Faker::Lorem.words(5).join("\s"), body: Faker::Lorem.words(50).join("\s")},
                     {blog_category_id: blog_categories.shuffle.sample(1).first.id, headline: Faker::Lorem.words(5).join("\s"), body: Faker::Lorem.words(50).join("\s")},
                     {blog_category_id: blog_categories.shuffle.sample(1).first.id, headline: Faker::Lorem.words(5).join("\s"), body: Faker::Lorem.words(50).join("\s")}])

Blog.all.each do |blog|
  5.times {BlogComment.create(blog_id: blog.id, name: Faker::Name.name, body: Faker::Lorem.words(50).join("\s"))}
end

photo_albums = PhotoAlbum.create([{name: Faker::Lorem.words(1).first, description: Faker::Lorem.words(20).join("\s")},
                                  {name: Faker::Lorem.words(1).first, description: Faker::Lorem.words(20).join("\s")},
                                {name: Faker::Lorem.words(1).first, description: Faker::Lorem.words(20).join("\s")},
                                {name: Faker::Lorem.words(1).first, description: Faker::Lorem.words(20).join("\s")},
                                {name: Faker::Lorem.words(1).first, description: Faker::Lorem.words(20).join("\s")}])

if ENV['PHOTOS']                      
  photo_albums.each do |photo_album|
    5.times{Photo.create(photo_album_id: photo_album.id, description: Faker::Lorem.words(5).join("\s"), document: File.open("#{Rails.root.to_s}/spec/support/files/test_picture.jpg"))}
  end
end

puts "FIN!"