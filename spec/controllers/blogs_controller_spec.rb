require 'rails_helper'

describe BlogsController do
  describe 'GET index' do
    before {blog}
    it 'sets @blogs' do
      get :index
      expect(assigns[:blogs]).to_not be_nil
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
  
  describe 'GET edit'
  describe 'PUT update'
  describe 'DELETE destroy'
end