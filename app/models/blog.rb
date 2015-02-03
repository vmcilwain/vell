class Blog < ActiveRecord::Base
  validates :headline, :blog_category_id, :body, presence: true
  belongs_to :blog_category
end