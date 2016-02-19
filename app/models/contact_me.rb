# @author Lovell McIlwain
# Handles business logic for contact me
class ContactMe < ActiveRecord::Base
  # Used with elasticsearch
  searchkick
  
  # ActiveRecord Validation to ensure name, email and body are present on submission
  validates :name, :email, :body, presence: true
  
  # ActiveRecord Callback
  # (see #reindex_blog)
  after_save :reindex_blog
  
  # Searchkick index fields
  def search_data
    {
      name: name,
      email: email,
      body: body,
      created_at: created_at
    }
  end

  private
  
  # Rebuild search index
  def reindex_blog
    ContactMe.reindex # or reindex_async
  end
end