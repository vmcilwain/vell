ATTACHMENT_ROOT = Rails.root.to_s + "/spec/support/files"

def blog_file
  @blog_file ||= Fabricate :blog_file
end

def contact_me
  @contact_me ||= Fabricate :contact_me
end

def blog_category
  @blog_category ||= Fabricate :blog_category
end

def blog
  @blog ||= Fabricate :blog
end

def blog_comment
  @blog_comment ||= Fabricate :blog_comment
end

def text(count=5)
  Faker::Lorem.words(count).join("\s")
end

def photo_album
  @photo_album ||= Fabricate :photo_album
end

def photo
  @photo ||= Fabricate :photo
end

def user
  @user ||= Fabricate :user
end

def admin_user
  @admin_user ||= Fabricate :user, admin: true
end
