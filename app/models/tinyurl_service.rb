class TinyurlService
  attr_reader :url, :tiny_url
  include HTTParty
  base_uri 'http://tinyurl.com'
    
  def initialize(url)
    @url = url
  end
  
  def tiny_url
    self.class.post('/api-create.php', {query: {url: @url}}).body
  end
end
=begin
http://tinyurl.com/api-create.php?url=http://scripting.com/
=end