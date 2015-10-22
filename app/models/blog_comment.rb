class BlogComment < ActiveRecord::Base
  searchkick

  belongs_to :blog

  validates :blog_id, :name, :body, presence: true

  after_save :reindex_blog_comment

  private
  def reindex_blog_comment
    BlogComment.reindex # or reindex_async
  end
end
