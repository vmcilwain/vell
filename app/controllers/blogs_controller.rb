class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end
  
  def new
    @blog = Blog.new
  end
  
  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      flash[:success] = 'Blog created!'
      redirect_to @blog
    else
      flash[:error] = 'There has been a problem!'
      render :new
    end
  end
  
  private
  
  def blog_params
    params.require(:blog).permit(:blog_category_id, :headline, :body)
  end
end