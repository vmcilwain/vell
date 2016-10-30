# @author Lovell McIlwain
#
# Class every presenter class should inherit from
class BasePresenter
  # Initialize class with object to be presented and the view it is to be presented on
  def initialize(object, template)
    @object = object
    @template = template
  end

  # Produces -> 2009-01-26
  def short_date(date)
    date.strftime("%Y-%m-%d")
  end

  #Produces -> 18 October 2015
  def medium_date2(date)
    date.strftime("%d %B %Y")
  end

  # Strips html tags from text
  def to_text(text)
    text.gsub(/<\/?[^>]+>/, '')
  end

private
 # Class method to call the object by its class
  def self.presents(name)
    define_method(name) do
      @object
    end
  end

  # Accessor for template methods
  def t
    @template
  end

  # In the event a method called can't be found, default to the template methods
  def method_missing(*args, &block)
    @template.send(*args, &block)
  end
end
