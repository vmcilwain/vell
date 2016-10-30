# @author Lovell McIlwain
# Handles helper methods for the application
module ApplicationHelper
  # create searchable links for blog tags
  def blog_tag_links(blog)
    raw blog.tag_list.map { |t| link_to t, blog_tag_path(t) }.join(', ')
  end

  # Create object presenter for use in views.
  #
  # @param object [Object], the object that has a presenter class
  # @return object_presenter [ObjectPresenter], the presenter object to be used in the view
  # Example in haml:
  # - present object do |object_presenter|
  #   ...
  #   ...
  def present(object, klass = nil)
   klass ||= "#{object.class}Presenter".constantize
   presenter = klass.new(object, self)
   yield presenter if block_given?
   presenter
  end
end
