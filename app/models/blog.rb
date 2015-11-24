class Blog < ActiveRecord::Base
  searchkick

  validates :headline, :body, presence: true

  has_many :blog_files

  has_many :blog_comments

  after_save :reindex_blog

  accepts_nested_attributes_for :blog_files, allow_destroy: true

  acts_as_taggable
  acts_as_taggable_on :announcements, :ruby, :rubyonrails, :linux, :General
  
  extend FriendlyId
  friendly_id :headline, use: :slugged
  
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
