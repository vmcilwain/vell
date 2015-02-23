require 'rails_helper'

describe GoogleUrlShortenerService, :vcr do
  let(:gus) {GoogleUrlShortenerService.new('http://www.yahoo.com')}
  
  it 'sets @url' do
    expect(gus.url).to eq 'http://www.yahoo.com'
  end
  
  describe '#short_url' do
    it 'returns a url containing http://goo.gl/' do
      expect(gus.short_url).to include 'http://goo.gl/'
    end
  end
  
  describe '#long_url' do
    it 'returnes submitted url' do
      expect(gus.long_url).to eq 'http://www.yahoo.com/'
    end
  end
end