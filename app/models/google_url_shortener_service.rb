class GoogleUrlShortenerService
  attr_reader :url, :short_url, :long_url
  include HTTParty
  base_uri 'https://www.googleapis.com'
    
  def initialize(url)
    @url = url
    @key = ENV['GOOGLE_API_KEY']
  end
  
  def api_data
    @data ||= JSON.parse(self.class.post('/urlshortener/v1/url', headers: { 'Content-Type' => 'application/json' }, body: {longUrl: @url, key: @key}.to_json).body)
  end
  
  def short_url
    api_data['id']
  end
  
  def long_url
    api_data['longUrl']
  end
end

#HTTParty.post('https://www.googleapis.com/urlshortener/v1/url', headers: { 'Content-Type' => 'application/json' }, body: {longUrl: 'http://www.yahoo.com'}.to_json).bod