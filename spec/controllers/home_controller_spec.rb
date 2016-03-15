require 'rails_helper'

describe HomeController do
  let(:blogs) {[]}
  let(:projects) {[]}

  describe 'GET index' do
    before do
      3.times {blogs << Fabricate(:blog)}
      3.times {projects << Fabricate(:project)}
      get :index
    end

    it 'sets @blogs' do
      expect(assigns[:blogs]).to eq blogs
    end

    it 'sets @projects' do
      expect(assigns[:projects]).to eq projects
    end
  end
end
