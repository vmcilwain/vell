Fabricator :blog_file do
  blog
  doc File.open(File.join(Rails.root.to_s, "spec", "support", "files", "test_file.txt"))
  description 'uploaded file from fabricator'
end