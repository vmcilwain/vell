require 'rails_helper'

describe BlogsController do
  describe 'GET index' do
    before {blog}
    it 'sets @blogs' do
      get :index
      expect(assigns[:blogs]).to_not be_nil
    end
  end
  
  def show
    let(:blog) {Fabricate :blog}
    it 'sets @blog' do
      get :show, blog.id
      expect(assigns[:blog]).to eq blog
    end
  end
  
  describe 'GET new' do
    it 'sets @blog' do
      get :new
      expect(assigns[:blog]).to be_instance_of Blog
    end
  end
  
  describe 'POST create' do
    context 'a successful creation' do
      before{post :create, blog: {headline: Faker::Lorem.words(5).join("\s"), blog_category_id: 1, body: Faker::Lorem.words(25).join("\s")}}
      
      it 'redirects to :show' do
        expect(response).to redirect_to Blog.first
      end
      
      it 'sets @blog' do
        expect(assigns[:blog]).to be_instance_of Blog
      end
      
      it 'sets flash[:success]' do
        expect(flash[:success]).to_not be_nil
      end
    end
    
    context 'an unsuccessful creation' do
      before{post :create, blog: {blog_category_id: 1, body: Faker::Lorem.words(25).join("\s")}}
      
      it 'renders :new' do
        expect(response).to render_template :new
      end
      
      it "sets @blog" do
        expect(assigns[:blog]).to be_instance_of Blog
      end
      
      it 'sets flash[:error]' do
        expect(flash[:error]).to_not be_nil
      end
    end
  end
  
  describe 'GET edit' do
    let(:blog) {Fabricate :blog}
    it 'sets @blog' do
      get :edit, id: blog.id
      expect(assigns[:blog]).to eq blog
    end
  end
  
  describe 'PUT update' do
    let(:blog) {Fabricate :blog}
    context 'a succesful update' do
      before{put :update, id: blog.id, blog: {headline: Faker::Lorem.words(5).join("\s"), blog_category_id: 1, body: Faker::Lorem.words(25).join("\s")}}
      
      it 'redirects to :show' do
        expect(response).to redirect_to blog_path(blog)
      end
      
      it 'sets @blog' do
        expect(assigns[:blog]).to eq blog
      end
      
      it 'sets flash[success]' do
        expect(flash[:success]).to_not be_nil
      end
    end
    
    context 'an unsuccessful update' do
      before{put :update, id: blog.id, blog: {headline: Faker::Lorem.words(5).join("\s"), blog_category_id: 1, body: ""}}
      
      it 'renders :new' do
        expect(response).to render_template :new
      end
      
      it 'sets @blog' do
        expect(assigns[:blog]).to eq blog
      end
      
      it 'sets flash[:error]' do
        expect(flash[:error]).to_not be_nil
      end
    end
  end
  
  describe 'DELETE destroy' do
    let(:blog) {Fabricate :blog}
    before{delete :destroy, id: blog.id}
    it 'sets @blog' do
      expect(assigns[:blog]).to eq blog
    end
    
    it 'destroys @blog' do
      expect(Blog.where(id: blog.id)).to eq []
    end
    
    it 'redirects to :index' do
      expect(response).to redirect_to blogs_path
    end
    
    it 'sets flash[:success]' do
      expect(flash[:success]).to_not be_nil
    end
  end
end