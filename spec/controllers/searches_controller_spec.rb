require 'rails_helper'

describe SearchesController do
  let(:user) {Fabricate :user}
  before {sign_in user}
  describe 'GET index' do
    context 'articles' do
      describe 'searching headlines' do
        let(:blog) {Fabricate :blog, headline: 'hello world'}
        before do
          blog
          2.times {Fabricate :blog}
          get :index, params: {klass: 'article', q: 'world'}
        end

        it 'renders searches/articles' do
          expect(response).to render_template 'searches/articles'
        end

        it 'sets @blogs' do
          expect(assigns[:blogs].results).to eq [blog]
        end
      end

      describe 'searching body'
      describe 'searching comment body'
    end

    context 'projects' do
      let(:project) {Fabricate :project, description: 'some text in the body'}
      before do
        project
        2.times {Fabricate :project}
        get :index, params: {klass: 'project', q: 'text'}
      end

      it 'renders searches/projects' do
        expect(response).to render_template 'searches/projects'
      end

      it 'sets @projects' do
        expect(assigns[:projects].results).to eq [project]
      end
    end
  end
end
