# @author Lovell McIlwain
# Handles helper methods for the application
module ApplicationHelper
  # Produces -> Thursday 25 May 2006 - 1:08 PM
  def long_date(date)
    date.strftime("%A %d %B %Y - %H:%M %p")
  end

  # Produces -> 2009-01-26
  def medium_date(date)
    date.strftime("%Y-%m-%d - %H:%M %p")
  end

  #Produces -> 18 October 2015
  def medium_date2(date)
    date.strftime("%d %B %Y")
  end

  # Produces -> 2009-01-26
  def short_date(date)
    date.strftime("%Y-%m-%d") rescue ''
  end

  # Strips html tags from text
  def to_text(text)
    text.gsub(/<\/?[^>]+>/, '')
  end

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
