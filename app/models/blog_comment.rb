class BlogComment < ActiveRecord::Base
  searchkick
  
  belongs_to :blog
  
  validates :blog_id, :name, :body, presence: true
end