# @author Lovell McIlwain
# Handles helper methods for the application
module ApplicationHelper
  # Long date format
 #
 # @param date [Date] the date object
 # @return day date month year - hour:minutes AM/PM
 def long_date(date)
   date.strftime("%A %d %B %Y - %H:%M %p") rescue 'unknown'
 end

 # Medium date format
 #
 # @param date [Date] the date object
 # @return month/date/year at hour:minutes AM/PM
 def medium_date(date)
   date.strftime("%m/%d/%Y at %H:%M %p") rescue 'unknown'
 end

 # Another style of medium date format
 #
 # @param date [Date] the date object
 # @return day/MONTH/YEAR
 # Produces -> 18 October 2015
 def medium_date2(date)
   date.strftime("%d %B %Y") rescue 'unknown'
 end

 # Short date format
 #
 # @param date [Date] the date object
 # @return year-month-date
 def short_date(date)
   date.strftime("%Y-%m-%d") rescue 'unknown'
 end

 # US date format
 #
 # @param date [Date] the date object
 # @return year-month-date
 def us_date(date)
   date.strftime("%m/%d/%Y at %H:%M %p") rescue 'unknown'
 end
 
  # create searchable links for blog tags
  def blog_tag_links(blog)
    raw blog.tag_list.map { |t| link_to t, blog_tag_path(t) }.join(', ')
  end

  # Unified view pagination
  def paginate(collection)
    will_paginate collection, class: 'apple_pagination'
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
