ATTACHMENT_ROOT = Rails.root.to_s + "/spec/support/files"

def blog_file
  @blog_file ||= Fabricate :blog_file
end

def test_file
  File.open "#{ATTACHMENT_ROOT}/test_file.txt"
end

def contact_me
  @contact_me ||= Fabricate(:contact_me)
end

def blog_category
  @blog_category ||= Fabricate(:blog_category)
end

def blog
  @blog ||= Fabricate(:blog)
end

def text(count=5)
  Faker::Lorem.words(count).join("\s")
end
