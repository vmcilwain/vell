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
  
  describe "GET new"
  describe "POST create"
  describe "GET edit"
  describe "PUT update"
  describe 'DELETE destroy'
end