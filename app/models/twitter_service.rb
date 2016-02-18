class TwitterService
  attr_reader :blog, :message
  include HTTParty
  base_uri 'http://tinyurl.com'
    
  def initialize(blog)
    @blog = blog
  end
  
  def message
    "#blog #blogging #{@blog.headline}: #{tiny_url}"
  end
  
  def update
    if $twitter.update(message)
      status, message = 'complete', 'Posted to twitter'
    end
  end
  
  private
  
  def blog_url
    "http://www.lovell.direct/blogs/#{@blog.slug}"
  end
  
  def tiny_url
    self.class.post('/api-create.php', {query: {url: blog_url}}).body
  end
end

=begin
http://tinyurl.com/api-create.php?url=http://scripting.com/
=end