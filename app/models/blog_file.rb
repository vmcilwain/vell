class BlogFile < ActiveRecord::Base
  searchkick

  belongs_to :blog

  has_attached_file :doc
  
  before_post_process :skip_for_zip

  validates_attachment_presence :doc

   # Validate the attached image is image/jpg, image/png, etc
   validates_attachment_content_type :doc, :content_type => ALLOWABLE_APPLICATIONS + ALLOWABLE_IMAGES

   validates_associated :blog

   after_save :reindex_blog_file

   def skip_for_zip
     ! %w(application/zip application/x-zip).include?(doc_content_type)
   end

   private
   def reindex_blog_file
     BlogFile.reindex # or reindex_async
   end
end
