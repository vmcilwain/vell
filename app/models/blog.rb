class Blog < ActiveRecord::Base
  validates :headline, :blog_category_id, :body, presence: true
  belongs_to :blog_category
  has_many :blog_files
  accepts_nested_attributes_for :blog_files, allow_destroy: true
end
