# @author Lovell McIlwain
#
# Presenter class for object views
class BlogPresenter < BasePresenter
  # Reference initialized object_presenter as object
  presents :blog

  delegate :headline, to: :blog
  delegate :body, to: :blog
  delegate :created_at, to: :blog

  # Return blog headline as a url
  def headline_link
    link_to blog.headline, blog
  end

  # Return blog edit path
  def edit_link
    link_to :Edit, edit_blog_path(blog)
  end

  # Return blog destroy path
  def delete_link
    link_to :Delete, blog, method: :delete, data: {confirm: 'Are you sure?'}
  end

  # Return count of comments
  def comments_count
    pluralize(blog.blog_comments.count, 'Comment')
  end

  # Return count of comments as a link
  def comments_count_link
    link_to pluralize(blog.blog_comments.count, 'Comment'), blog
  end

  # Return count of files as a link
  def files_count_link
    link_to pluralize(blog.blog_files.count, 'File'), blog  
  end

  # Return count of files
  def files_count
    pluralize(blog.blog_files.count, 'File')
  end

  # Returns raw body
  def raw_body
    raw blog.body
  end

  # Returns short form of created at
  def short_created_at
    short_date blog.created_at
  end

  # Returns truncated blog body
  def truncated_body
    truncate(to_text(blog.body), length: 50) {link_to ' Read More', blog}
  end
end
