require 'rails_helper'

describe TwitterService, :vcr do
  let(:blog) {Fabricate :blog}
  let(:twitter) {TwitterService.new(blog)}
  
  it 'sets @blog' do
    expect(twitter.blog).to eq blog
  end
  
  describe '#message' do
    it 'sets message for update' do
      expect(twitter.message).to include "#blog #blogging #{blog.headline}:"
    end
  end
end