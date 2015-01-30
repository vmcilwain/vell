class BlogCategoriesController < ApplicationController
  before_action :blog_category, only: [:show, :edit, :update, :destroy]
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
      flash[:error] = 'Blog Category Not Updated!'
      render :edit
    end
  end

  def destroy
    @blog_category.update(enabled: false)
    flash[:success] = "Blog Category Disabled!"
    redirect_to blog_categories_path
  end

  private
  
  def blog_category_params
    params.require(:blog_category).permit(:name)
  end

  def blog_category
    @blog_category = BlogCategory.find(params[:id])
  end
end
