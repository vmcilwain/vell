class BlogFile < ActiveRecord::Base
  searchkick
  
  belongs_to :blog
  
  has_attached_file :doc#, path: "#{Rails.env}/blog_files/:id/:basename.:extension"#, styles: {
     # thumb: '100x100>',
#      square: '200x200#',
#      medium: '300x300>'
#    }
   before_post_process :skip_for_zip
   
   validates_attachment_presence :doc
   
   # Validate the attached image is image/jpg, image/png, etc
   validates_attachment_content_type :doc, :content_type => ALLOWABLE_APPLICATIONS + ALLOWABLE_IMAGES
   
   validates_associated :blog
   
   def skip_for_zip
     ! %w(application/zip application/x-zip).include?(doc_content_type)
   end
end
