# @author Lovell McIlwain
# Handles business logic for posting to twitter
class TwitterService
  # Readable attributes
  attr_reader :blog, :message

  # Used by HTTParty
  include HTTParty

  # Used by HTTParty to set default ulr
  base_uri 'http://tinyurl.com'

  # Initializer to build instance variable
  def initialize(blog)
    @blog = blog
  end

  # Message to be posted to twitter
  def message
    "#blog #blogging #{@blog.headline}: #{tiny_url}"
  end

  # Method used by twitter gem to post message to twitter
  def update
    if $twitter.update(message)
      status, message = 'complete', 'Posted to twitter'
    end
  end

  private

  # Build url to send to tinyurl
  def blog_url
    "http://www.lovell.direct/blogs/#{@blog.slug}"
  end

  # Post url to tinyurl
  # @return [String] response from tinyurl
  def tiny_url
    self.class.post('/api-create.php', {query: {url: blog_url}}).body
  end
end

=begin
http://tinyurl.com/api-create.php?url=http://scripting.com/
=end
