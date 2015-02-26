 ALLOWABLE_IMAGES = ["image/gif", "image/jpeg", "image/jpg", "image/png"]
ALLOWABLE_APPLICATIONS = ["application/vnd.oasis.opendocument.text",
"application/vnd.oasis.opendocument.spreadsheet",
"application/vnd.oasis.opendocument.presentation",
"application/vnd.ms-excel",
"application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
"application/vnd.ms-powerpoint",
"application/vnd.openxmlformats-officedocument.presentationml.presentation",
"application/vnd.openxmlformats-officedocument.wordprocessingml.document",
"application/vnd.ms-word", "application/pdf", "text/plain"]

class BlogFile < ActiveRecord::Base
  belongs_to :blog
  
  has_attached_file :doc, styles: {
     thumb: '100x100>',
     square: '200x200#',
     medium: '300x300>'
   }
   # validates_attachment :doc, content_type: {content_type: ALLOWABLE_APPLICATIONS + ALLOWABLE_IMAGES}
   validates_attachment_presence :doc
   
   # Validate the attached image is image/jpg, image/png, etc
   # validates_attachment_content_type :doc, :content_type => /\Aimage\/.*\Z/
   validates_attachment_content_type :doc, :content_type => ALLOWABLE_APPLICATIONS + ALLOWABLE_IMAGES
end
