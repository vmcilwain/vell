require 'rails_helper'

describe TinyurlService, :vcr do
  let(:tiny) {TinyurlService.new('http://www.yahoo.com')}
  
  it 'sets @url' do
    expect(tiny.url).to eq 'http://www.yahoo.com'
  end
  
  describe '#tiny_url' do
    it 'returns a url containing http://goo.gl/' do
      expect(tiny.tiny_url).to include 'http://tinyurl.com/'
    end
  end
end