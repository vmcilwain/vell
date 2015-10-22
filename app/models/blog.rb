class Blog < ActiveRecord::Base
  searchkick

  validates :headline, :blog_category_id, :body, presence: true

  belongs_to :blog_category

  has_many :blog_files

  has_many :blog_comments

  after_save :reindex_blog

  accepts_nested_attributes_for :blog_files, allow_destroy: true

  def search_data
    {
      headline: headline,
      body: body,
      created_at: created_at,
      blog_comment_name: blog_comments.map(&:name),
      blog_comment_body: blog_comments.map(&:body)
    }
  end

  private

  def reindex_blog
    Blog.reindex # or reindex_async
  end
end
