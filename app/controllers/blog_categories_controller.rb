class BlogCategoriesController < ApplicationController
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
  
  private
  
  def blog_category_params
    params.require(:blog_category).permit(:name)
  end
end