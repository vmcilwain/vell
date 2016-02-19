# @author Lovell McIlwain
# Handles business logic for blog comment
class BlogComment < ActiveRecord::Base
  # Used with elasticsearch
  searchkick
  
  # ActiveRecord Association to parent record
  belongs_to :blog
  
  # ActiveRecord validation to ensure parent id and commenter name is present
  validates :blog_id, :name, :body, presence: true
  
  # ActiveRecord callback to run method after object is saved
  after_save :reindex_blog_comment

  private
  # Rebuild search index
  def reindex_blog_comment
    BlogComment.reindex # or reindex_async
  end
end
