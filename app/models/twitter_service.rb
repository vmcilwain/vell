class TwitterService
  attr_reader :blog, :tiny_url
  include HTTParty
  base_uri 'http://tinyurl.com'
    
  def initialize(blog)
    @blog = blog
  end
  
  def message
    "#blog #blogging #{@blog.headline}: #{tiny_url}"
  end
  
  def update
    $twitter.update(message)
  end
  
  private
  
  def blog_url
    "http://lovell.direct.com/blogs/#{@blog.id}"
  end
  
  def tiny_url
    self.class.post('/api-create.php', {query: {url: blog_url}}).body
  end
end

=begin
http://tinyurl.com/api-create.php?url=http://scripting.com/
=end