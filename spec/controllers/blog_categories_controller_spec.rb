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
  
  describe "GET edit" do
    let(:blog_category) {Fabricate :blog_category}
    
    before {get :edit, id: blog_category.id}
    
    it 'sets @blog_category' do
      expect(assigns[:blog_category]).to eq blog_category
    end
  end
  
  describe "PUT update" do
    let(:blog_category) {Fabricate :blog_category}
    
    it 'sets @blog_category' do
      put :update, id: blog_category.id, blog_category: {name: "new_name"}
      expect(assigns[:blog_category]).to eq blog_category
    end
    
    context 'a successful update' do
      it 'redirects to :show' do
        put :update, id: blog_category.id, blog_category: {name: "new_name"}
        expect(response).to redirect_to blog_category
      end

      it 'sets flash[:success]' do
        put :update, id: blog_category.id, blog_category: {name: "new_name"}
        expect(flash[:success]).to_not be_nil
      end
    end
    
    context 'an unsuccessful update' do
      let(:blog_category) {Fabricate :blog_category}

      before {put :update, id: blog_category.id, blog_category: {name: ""}}

      it 'renders :edit template' do
        expect(response).to render_template :edit
      end
      
      it 'sets flash[:error]' do
        expect(flash[:error]).to_not be_nil
      end
    end
  end
  
  describe 'DELETE destroy'
end