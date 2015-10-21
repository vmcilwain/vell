class BlogCommentsController < ApplicationController
  before_action :blog_comment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:new, :create]
  before_action :require_admin, except: [:new, :create]
  def index
    @blog_comments = BlogComment.search(params.fetch(:q, "*"), page: params[:page], per_page: 10) #elasticsearch
  end
  
  def new
    @blog = Blog.find(params[:blog_id])
    @blog_comment = BlogComment.new
  end
  
  def create
    @blog_comment = BlogComment.new(blog_comment_params)
    respond_to do|format|
      if @blog_comment.save
        format.html do
          flash[:success] = 'Blog comment created'
          redirect_to @blog_comment
        end
        format.js {}
        Notify.send_new_blog_comment(@blog_comment).deliver_now
      else
        @blog = Blog.find(params[:blog_comment][:blog_id])
        flash[:error] = 'There were errors'
        format.html {render :new}
        format.js {}
      end
    end
  end
  
  def edit
    @blog = @blog_comment.blog
  end
  
  def update
    if @blog_comment.update(blog_comment_params)
      flash[:success] = 'Blog comment updated'
      redirect_to @blog_comment
    else
      @blog = Blog.find(params[:blog_comment][:blog_id])
      flash[:error] = 'There were problems'
      render :edit
    end
  end
  
  def destroy
    @blog_comment.destroy
    flash[:success] = 'Blog comment destroyed'
    redirect_to blog_comments_path
  end
  
  private
  
  def blog_comment
    @blog_comment = BlogComment.find(params[:id])
  end
  
  def blog_comment_params
    params.require(:blog_comment).permit(:blog_id, :name, :body, :email)
  end
end