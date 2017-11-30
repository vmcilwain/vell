# @author Lovell McIlwain
#
# Presenter class for object views
class BlogFilePresenter < BasePresenter
  # Reference initialized object_presenter as object
  presents :blog_file

  delegate :description, to: :blog_file, allow_nil: true
  delegate :created_at, to: :blog_file, allow_nil: true
  
  # Return image as a download path
  def image_download_path
    link_to image_tag(blog_file.doc.url, width: '150px'), download_blog_files_path(id: blog_file.id)
  end

  # Return edit path
  def edit_link
    link_to :Edit, edit_blog_file_path(blog_file)
  end

  # Returns download path
  def download_path
    link_to blog_file.doc_file_name, download_blog_files_path(id: blog_file.id)
  end

  # Returns destroy path
  def delete_link
    link_to :Delete, blog_file, method: :delete, data: {confirm: 'Are you sure?'}
  end

  # Returns download link based on allowable images
  def download_link
    ALLOWABLE_IMAGES.include?(blog_file.doc_content_type) ? image_download_link : download_link
  end
end
