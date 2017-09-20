# @author Lovell McIlwain
#
# Presenter class for object views
class BlogCommentPresenter < BasePresenter
  # Reference initialized object_presenter as object
  presents :blog_comment

  delegate :created_at, to: :blog_comment
  delegate :body, to: :blog_comment
  delegate :name, to: :blog_comment

  # Return a medium date
  def medium_created_at
    medium_date2 blog_comment.created_at
  end

  # Return a medium date
  def medium_updated_at
    medium_date2 blog_comment.updated_at
  end

  # Return edit path
  def edit_link
    link_to :Edit, edit_blog_comment_path(blog_comment), class: 'small-text'
  end

  # Return a muted parent blog link
  def muted_headline_link
    link_to blog_comment.blog.headline, blog_comment.blog, class: 'text-muted'
  end

  # Returns destory path
  def delete_link
    link_to :Destroy, blog_comment_path(blog_comment), method: :delete, data: {confirm: 'Are you sure?'}, class: 'small-text'
  end

  # Return unmutted headline link
  def headline_link
    link_to blog_comment.blog.headline, blog_comment.blog
  end

  # Returns edit path as a button
  def edit_button
    link_to :Edit, edit_blog_comment_path(blog_comment), class: 'btn btn-primary btn-xs'
  end

  # Returns blog path as a button
  def blog_link
    link_to :Article, blog_comment.blog, class: 'small-text'
  end
end
