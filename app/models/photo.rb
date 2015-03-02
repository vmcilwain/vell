class Photo < ActiveRecord::Base
  belongs_to :photo_album
  
  validates :photo_album_id, :document, presence: true
  
  has_attached_file :document, :styles => { :medium => "300x300>", :thumb => "100x100>" }#, :default_url => "/images/:style/missing.png"
  
  validates_attachment_content_type :document, :content_type => /\Aimage\/.*\Z/
end