class BlogComment < ActiveRecord::Base
  belongs_to :blog
  
  validates :blog_id, :name, :body, presence: true
end