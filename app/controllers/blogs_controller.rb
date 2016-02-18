class BlogsController < ApplicationController
  before_action :blog, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :require_admin, except: [:index, :show]
  
  def index
    if params[:tag]
      @blogs = Blog.tagged_with(params[:tag]).paginate(page: params[:page], per_page: 10)
    else
      @blogs = Blog.search(params.fetch(:q, "*"), page: params[:page], per_page: 10) #elasticsearch
    end
  end
  
  def new
    @blog = Blog.new
    authorize @blog
    3.times {@blog.blog_files.build}
  end
  
  def create
    @blog = Blog.new(blog_params)
    authorize @blog
    if @blog.save
      @status, @message = TwitterService.new(@blog).update if @blog.to_twitter
      flash[:success] = 'Blog created!'
      flash[:success] << ' & tweeted!' if @blog.to_twitter
      redirect_to @blog
    else
      flash[:error] = 'There has been a problem!'
      render :new
    end
  end
  
  def edit
    authorize @blog
  end
  
  def update
    authorize @blog
    if @blog.update(blog_params)
      flash[:success] = 'Blog updated!'
      redirect_to @blog
    else
      flash[:error] = 'There was a problem!'
      render :new
    end
  end
  
  def destroy
    authorize @blog
    @blog.destroy
    flash[:success] = 'Blog deleted!'
    redirect_to blogs_path
  end
  
  private
  
  def blog
    @blog = Blog.friendly.find(params[:id])
  end
  
  def blog_params
    params.require(:blog).permit(:headline, :body, :to_twitter, :tag_list, blog_files_attributes: [:id, :blog_id, :description, :doc])
  end
end