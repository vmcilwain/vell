class BlogCategoriesController < ApplicationController
  before_action :blog_category, only: [:edit, :update, :destroy]

  def index
    @q = BlogCategory.ransack(params[:q])
    @blog_categories = @q.result.paginate(:page => params[:page], :per_page => 15)
  end
  
  def new
    @blog_category = BlogCategory.new
  end
  
  def create
    @blog_category = BlogCategory.new(blog_category_params)
    if @blog_category.save
      flash[:success] = "Blog Category Created!"
      redirect_to blog_categories_path
    else
      flash[:error] = "There was a problem!"
      render :new
    end
  end

  def update
    if @blog_category.update(blog_category_params)
      flash[:success] = 'Blog Category Updated!'
      redirect_to blog_categories_path
    else
      flash[:error] = 'There was a problem!'
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
    params.require(:blog_category).permit(:name, :enabled)
  end

  def blog_category
    @blog_category = BlogCategory.find(params[:id])
  end
end
