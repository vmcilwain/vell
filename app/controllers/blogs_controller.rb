class BlogsController < ApplicationController
  before_action :blog, only: [:edit, :update, :destroy]
  
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
  
  def update
    if @blog.update(blog_params)
      flash[:success] = 'Blog updated!'
      redirect_to @blog
    else
      flash[:error] = 'There was a problem!'
      render :new
    end
  end
  
  def destroy
    @blog.destroy
    flash[:success] = 'Blog deleted!'
    redirect_to blogs_path
  end
  
  private
  
  def blog
    @blog = Blog.find(params[:id])
  end
  
  def blog_params
    params.require(:blog).permit(:blog_category_id, :headline, :body)
  end
end