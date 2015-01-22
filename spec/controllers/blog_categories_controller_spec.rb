require 'rails_helper'

describe BlogCategoriesController do
  describe "GET index" do    
    it 'sets @blog_categories' do
      blog_categories = []
      2.times {blog_categories << Fabricate(:blog_category)}
      get :index
      expect(assigns[:blog_categories]).to eq blog_categories
    end
  end
  
  describe "GET new" do
    it 'sets @blog_category' do
      get :new
      expect(assigns[:blog_category]).to be_instance_of BlogCategory
    end
  end
  
  describe "POST create" do    
    it 'sets @blog_category' do
      post :create, blog_category: {name: Faker::Lorem.words(1).first}
      expect(assigns[:blog_category]).to be_instance_of BlogCategory
    end
    
    context 'a successful creation' do
      it 'redirects to :index' do
        post :create, blog_category: {name: Faker::Lorem.words(1).first}
        expect(response).to redirect_to blog_categories_path
      end
      
      it 'sets flash[:success]' do
        post :create, blog_category: {name: Faker::Lorem.words(1).first}
        expect(flash[:success]).to_not be_nil
      end
    end
    
    context 'an unsuccesful creation' do
      it 'renders :new' do
        post :create, blog_category: {name: ''}
        expect(response).to render_template :new
      end
      
      it 'sets flash[:error]' do
        post :create, blog_category: {name: ''}
        expect(flash[:error]).to_not be_nil
      end
    end
  end
  
  describe "GET edit"
  describe "PUT update"
  describe 'DELETE destroy'
end