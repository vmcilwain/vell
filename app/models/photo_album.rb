class PhotoAlbum < ActiveRecord::Base
  validates :name, presence: true
  has_many :photos
  validates_associated :photos
end