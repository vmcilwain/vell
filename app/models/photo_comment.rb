class PhotoComment < ActiveRecord::Base
  belongs_to :photo
  validates :photo_id, :name, :headline, :body, presence: true
end