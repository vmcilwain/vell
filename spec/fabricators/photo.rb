Fabricator :photo do
  photo_album
  document File.open(File.join(Rails.root.to_s, "spec", "support", "files", "test_picture.jpg"))
  description 'uploaded file from fabricator'
end