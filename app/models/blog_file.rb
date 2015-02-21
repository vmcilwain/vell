class BlogFile < ActiveRecord::Base
  belongs_to :blog
  validates :blog_id, :blog_document, presence: true
  mount_uploader :blog_document, BlogFileUploader
end
