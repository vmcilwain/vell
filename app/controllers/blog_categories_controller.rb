class BlogCategoriesController < ApplicationController
  def index
    @blog_categories = BlogCategory.all
  end
end