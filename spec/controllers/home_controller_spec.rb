require 'rails_helper'

describe HomeController do
  let(:blogs) {[]}
  describe 'GET index' do
    before do
      5.times {blogs << Fabricate(:blog)}
      get :index
    end
    
    it 'sets @blogs' do
      blogs.shift
      expect(assigns[:blogs]).to eq blogs
    end
  end
end