module ApplicationHelper
  # Produces -> Thursday 25 May 2006 - 1:08 PM
  def long_date(date)
    h date.strftime("%A %d %B %Y - %H:%M %p")
  end

  # Produces -> 2009-01-26
  def medium_date(date)
    h date.strftime("%Y-%m-%d - %H:%M %p")
  end

  # Produces -> 2009-01-26
  def short_date(date)
    h date.strftime("%Y-%m-%d") rescue ''
  end
end
