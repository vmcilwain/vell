require 'rails_helper'

describe HomeController do
  let(:blogs) {[]}

  describe 'GET index' do
    before do
      3.times {blogs << Fabricate(:blog)}
      get :index
    end

    it 'sets @blogs' do
      expect(assigns[:blogs]).to eq blogs.reverse
    end
  end
end
