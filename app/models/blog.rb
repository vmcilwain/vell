# @author Lovell McIlwain
# Handles business logic for blog
class Blog < ApplicationRecord
  # Used with elasticsearch
  searchkick

  # ActiveRecord validation to ensure headline and body are present
  validates :headline, :body, presence: true

  # ActiveRecord Association to child records
  has_many :blog_files

  # ActiveRecord Association to child records
  has_many :blog_comments

  #ActiveRecord Callback
  # (see #reindex_blog)
  after_save :reindex_blog

  # Accept attribtues for blog files to be created
  accepts_nested_attributes_for :blog_files, allow_destroy: true

  # Used with acts_as_taggable
  acts_as_taggable

  # Used with acts_as_taggable
  acts_as_taggable_on :announcements, :ruby, :rubyonrails, :linux, :General

  # Allow blog to to use friendly ids instead of ids
  extend FriendlyId

  # Use headline as the friendly id
  friendly_id :headline, use: :slugged

  # Searchkick index fields
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

  # Rebuild search index
  def reindex_blog
    Blog.reindex # or reindex_async
  end
end
