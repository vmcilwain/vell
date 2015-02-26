class PhotoAlbum < ActiveRecord::Base
  validates :name, presence: true
end