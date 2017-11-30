require 'rails_helper'

describe BlogFilesController do
  let(:user) {Fabricate :user}
  let(:blog) {Fabricate :blog}
  after {delete_files}

  describe 'GET index' do
    let(:files) {[]}
    before do
      2.times {files << Fabricate(:blog_file)}
      user.update(admin: true)
      sign_in user
      get :index
    end

    it 'sets @blog_files' do
      expect(assigns[:blog_files].results.size).to eq files.size
    end
  end

  describe 'GET new', :vcr do
    before do
      user.update(admin: true)
      sign_in user
      get :new
    end

    it 'sets @blog_file' do
      expect(assigns[:blog_file]).to be_instance_of BlogFile
    end
  end

  describe 'POST create', :vcr do
    require 'rack/test'

    context 'a successful creation' do
      before do
        user.update(admin: true)
        sign_in user
        post :create, params: {blog_file: {blog_id: blog.id, doc: file_to_upload(web_test_file, "text/plain")}}
      end

      it 'redirects_to :show' do
        expect(response).to redirect_to BlogFile.last
      end

      it 'sets @blog_file' do
        expect(assigns[:blog_file]).to be_instance_of BlogFile
      end

      it 'sets flash[:success]' do
        expect(flash[:success]).to_not be_nil
      end
    end

    context 'an unsuccessful creation' do
      before do
        user.update(admin: true)
        sign_in user
        post :create, params: {blog_file: {blog_id: blog.id}}
      end

      it 'renders :new' do
        expect(response).to render_template :new
      end

      it 'sets @blog_file' do
        expect(assigns[:blog_file]).to be_instance_of BlogFile
      end

      it 'sets flash[:error]' do
        expect(flash[:error]).to_not be_nil
      end
    end
  end

  describe 'GET edit', :vcr do
    let(:blog_file) {Fabricate :blog_file}

    it 'sets @blog_file' do |variable|
      get :edit, params: {id: blog_file.id}
      expect(assigns[:blog_file]).to eq blog_file
    end
  end

  describe 'PUT update', :vcr do
    require 'rack/test'
    let(:blog_file) {Fabricate :blog_file}

    context 'a successful update' do
      before do
        user.update(admin: true)
        sign_in user
        put :update, params: {id: blog_file.id, blog_file: {blog_id: blog_file.blog.id, doc: file_to_upload(web_test_file, "text/plain")}}
      end

      it 'redirects_to :show' do
        expect(response).to redirect_to blog_file
      end

      it 'sets @blog_file' do
        expect(assigns[:blog_file]).to eq blog_file
      end

      it 'sets flash[:success]' do
        expect(flash[:success]).to_not be_nil
      end
    end

  end

  describe 'DELETE destroy', :vcr do
    let(:blog_file) {Fabricate :blog_file}
    let(:blog) {blog_file.blog}

    before do
      user.update(admin: true)
      sign_in user
      delete :destroy, params: {id: blog_file.id}
    end

    it 'sets @blog_file' do
      expect(assigns[:blog_file]).to eq blog_file
    end

    it 'destroys @blog_file' do
      expect(BlogFile.where(id: blog_file.id)).to eq []
    end

    it 'redirects_to :index' do
      expect(response).to redirect_to blog_path(blog)
    end

    it 'sets flash[:success]' do
      expect(flash[:success]).to_not be_nil
    end
  end
end
