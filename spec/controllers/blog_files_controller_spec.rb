require 'rails_helper'

describe BlogFilesController do
  after {delete_files}
  describe 'GET index' do
    let(:user) {Fabricate :user}
  
    before do
      add_user_to_role(user, 'administrator')
      session[:user_id] = user.id
    end
    
    it 'sets @blog_files' do
      blog_file1 = Fabricate :blog_file
      blog_file2 = Fabricate :blog_file
      get :index
      expect(assigns[:blog_files]).to eq [blog_file1, blog_file2]
    end
  end
  
  describe 'GET show', :vcr do
    let(:blog_file) {Fabricate :blog_file}
    it 'sets @blog_file' do
      get :show, id: blog_file.id
      expect(assigns[:blog_file]).to eq blog_file
    end
  end
  
  describe 'GET new', :vcr do
    let(:user) {Fabricate :user}
  
    before do
      add_user_to_role(user, 'administrator')
      session[:user_id] = user.id
    end
    
    it 'sets @blog_file' do
      get :new
      expect(assigns[:blog_file]).to be_instance_of BlogFile
    end
  end
  
  describe 'POST create', :vcr do
    require 'rack/test'
    
    context 'a successful creation' do
      let(:user) {Fabricate :user}
      before do
        add_user_to_role(user, 'administrator')
        session[:user_id] = user.id
        post :create, blog_file: {blog_id: 1, doc: file_to_upload(test_file, "text/plain")}
      end
      
      it 'redirects_to :show' do
        expect(response).to redirect_to BlogFile.first
      end
      
      it 'sets @blog_file' do
        expect(assigns[:blog_file]).to be_instance_of BlogFile
      end

      it 'sets flash[:success]' do
        expect(flash[:success]).to_not be_nil
      end
    end
    
    context 'an unsuccessful creation' do
      let(:user) {Fabricate :user}
      before do
        add_user_to_role(user, 'administrator')
        session[:user_id] = user.id
        post :create, blog_file: {blog_id: 1}
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
      get :edit, id: blog_file.id
      expect(assigns[:blog_file]).to eq blog_file
    end
  end
  
  describe 'PUT update', :vcr do
    require 'rack/test'
    let(:blog_file) {Fabricate :blog_file}
    
    context 'a successful update' do
      let(:user) {Fabricate :user}

      before do
        add_user_to_role(user, 'administrator')
        session[:user_id] = user.id
        put :update, id: blog_file.id, blog_file: {blog_id: 1, doc: file_to_upload(test_file, "text/plain")}
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
    let(:user) {Fabricate :user}
  
    before do
      add_user_to_role(user, 'administrator')
      session[:user_id] = user.id
      delete :destroy, id: blog_file.id
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
