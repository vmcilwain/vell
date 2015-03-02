class BlogCategory < ActiveRecord::Base
  validates :name, presence: true
  
  has_many :blogs
  
  before_create :set_enabled
  
  validates_associated :blogs
  
  def set_enabled
    self.enabled = true
  end
end
