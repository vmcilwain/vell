class ContactMe < ActiveRecord::Base
  searchkick
  
  validates :name, :email, :body, presence: true
  
  after_save :reindex_blog
  
  def search_data
    {
      name: name,
      email: email,
      body: body,
      created_at: created_at
    }
  end

  private

  def reindex_blog
    ContactMe.reindex # or reindex_async
  end
end