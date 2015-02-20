Fabricator :blog_file do
  blog
  blog_document File.open(Rails.root.to_s + "/spec/support/files/test_file.txt")
  description 'uploaded file from fabricator'
end