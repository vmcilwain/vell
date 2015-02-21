require 'rails_helper'

describe BlogFilesController do
  describe 'GET index' do
    it 'sets @blog_files' do
      blog_file1 = Fabricate :blog_file
      blog_file2 = Fabricate :blog_file
      get :index
      expect(assigns[:blog_files]).to eq [blog_file1, blog_file2]
    end
  end
  
  describe 'GET show' do
    let(:blog_file) {Fabricate :blog_file}
    it 'sets @blog_file' do
      get :show, id: blog_file.id
      expect(assigns[:blog_file]).to eq blog_file
    end
  end
  
  describe 'GET new' do
    it 'sets @blog_file' do
      get :new
      expect(assigns[:blog_file]).to be_instance_of BlogFile
    end
  end
  
  describe 'POST create' do
    require 'rack/test'
    
    context 'a successful creation' do
      before {post :create, blog_file: {blog_id: 1, blog_document: file_to_upload(test_file, "text/plain")}}
      
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
      before {post :create, blog_file: {blog_id: 1}}
      
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
  
  describe 'GET edit' do
    let(:blog_file) {Fabricate :blog_file}

    it 'sets @blog_file' do |variable|
      get :edit, id: blog_file.id
      expect(assigns[:blog_file]).to eq blog_file
    end
  end
  
  describe 'PUT update' do
    require 'rack/test'
    let(:blog_file) {Fabricate :blog_file}
    
    context 'a successful update' do
      before {put :update, id: blog_file.id, blog_file: {blog_id: 1, blog_document: file_to_upload(test_file, "text/plain")}}
      
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
    
    context 'an unsuccessful update' do
      before {put :update, id: blog_file.id, blog_file: {blog_id: nil, blog_document: file_to_upload(test_file, "text/plain")}}
      
      it 'renders :edit' do
        expect(response).to render_template :edit
      end
      
      it 'sets @blog_file' do
        expect(assigns[:blog_file]).to eq blog_file
      end
      
      it 'set flash[:error]' do
        expect(flash[:error]).to_not be_nil
      end
    end
  end
end
