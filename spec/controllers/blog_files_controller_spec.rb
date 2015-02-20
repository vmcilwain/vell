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
    context 'a successful creation' do
      before {post :create, blog_file: {blog_id: 1, blog_document: test_file}}
      
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
    
    # context 'an unsuccessful creation' do
    #   before {post :create, blog_file: {blog_id: 1}}
    #   it 'renders :new' do
    #     expect(response).to render_template :new
    #   end
    #
    #   it 'sets @blog_file'
    #   it 'sets flash[:error]'
    # end
  end
  describe 'GET edit'
  describe 'PUT update'
end
