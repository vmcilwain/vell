def contact_me
  @contact_me ||= Fabricate(:contact_me)
end

def blog_category
  @blog_category ||= Fabricate(:blog_category)
end

def blog
  @blog ||= Fabricate(:blog)
end