module ApplicationHelper
  # Produces -> Thursday 25 May 2006 - 1:08 PM
  def long_date(date)
    date.strftime("%A %d %B %Y - %H:%M %p")
  end

  # Produces -> 2009-01-26
  def medium_date(date)
    date.strftime("%Y-%m-%d - %H:%M %p")
  end
  
  #Produces -< 18 October 2015
  def medium_date2(date)
    date.strftime("%d %B %Y")
  end

  # Produces -> 2009-01-26
  def short_date(date)
    date.strftime("%Y-%m-%d") rescue ''
  end
  
  def to_text(text)
    text.gsub(/<\/?[^>]+>/, '')
  end
  
  def blog_tag_links(blog)
    raw blog.tag_list.map { |t| link_to t, blog_tag_path(t) }.join(', ')
  end
end
