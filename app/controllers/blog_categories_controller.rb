class BlogCategoriesController < ApplicationController
  before_action :blog_category, only: [:edit, :update]
  def index
    @blog_categories = BlogCategory.all
  end
  
  def new
    @blog_category = BlogCategory.new
  end
  
  def create
    @blog_category = BlogCategory.new(blog_category_params)
    if @blog_category.save
      flash[:success] = "Blog Category has been created!"
      redirect_to blog_categories_path
    else
      flash[:error] = "There was a problem!"
      render :new
    end
  end
  
  def update
    if @blog_category.update(blog_category_params)
      flash[:success] = 'Blog Category Updated!'
      redirect_to @blog_category
    else
      flash[:error] = 'There was a problem!'
      render :edit
    end
  end
  
  private
  def blog_category
    @blog_category = BlogCategory.find(params[:id])
  end
  
  def blog_category_params
    params.require(:blog_category).permit(:name)
  end
end