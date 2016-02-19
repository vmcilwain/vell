# @author Lovell McIlwain
# Handles business logic for blog file
class BlogFile < ActiveRecord::Base
  # Used with elasticsearch
  searchkick
  
  # ActiveRecord Association to parent record
  belongs_to :blog
  
  # Provided by Paperclip to upload files
  has_attached_file :doc
  
  # Paperclip Callback to run methods before saving blog file
  # (see #skip_for_zip)
  before_post_process :skip_for_zip
  
  # Validation provided by Paperclip to validate file being uploaded
  validates_attachment_presence :doc

   # Validation provided by Paperclip to validate the allowable file types for uploaded
   # (see #ALLOWABLE_APPLICATIONS)
   # (see #ALLOWABLE_IMAGES)
   validates_attachment_content_type :doc, :content_type => ALLOWABLE_APPLICATIONS + ALLOWABLE_IMAGES
   
   # ActiveRecord validation for associated record
   validates_associated :blog
   
   # ActiveRecord callback to run methods after saving blog file
   # (see #reindex_blog_files)
   after_save :reindex_blog_file
   
   # Method to skip zip files when processing
   def skip_for_zip
     ! %w(application/zip application/x-zip).include?(doc_content_type)
   end

   private
   
   # Rebuild search index
   def reindex_blog_file
     BlogFile.reindex # or reindex_async
   end
end
