# @author Lovell McIlwain
# Handles HTTP actions for blog commeents
class BlogCommentsController < ApplicationController
  # Before action to load blog comment
  # (see #blog_comment)
  before_action :blog_comment, only: [:show, :edit, :update, :destroy]

  # Before action to prompt for authentication
  # @note uses devise gem
  before_action :authenticate_user!, except: [:new, :create]

  # Handles HTTP GET
  #
  # @return [Array] the list of blog comments
  def index
    authorize BlogComment
    @blog_comments = BlogComment.search(params.fetch(:q, "*"), page: params[:page], per_page: 10, order: {created_at: :desc}) #elasticsearch
  end

  # Handles HTTP GET
  #
  # @param blog_id [Integer] the id of the blog requested
  # @return [Blog] the blog object requested
  # @return [BlogComment] a new blog comment object
  def new
    authorize BlogComment
    @blog = Blog.find(params[:blog_id])
    @blog_comment = BlogComment.new
  end

  # Handles HTTP & JS POST
  #
  # @param blog_comment [Hash] the submitted attributes
  # (see #blog_comment_params)
  # #@return [BlogComment] the created blog comment object
  # @return [Hash] the flash notification
  # @note sends email notification on submission
  def create
    authorize BlogComment
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

  # Handles HTTP GET
  #
  # @param id [Integer] the id of the requested blog comment
  # @return [Blog] the related blog to the requested blog comment
  def edit
    authorize @blog_comment
    @blog = @blog_comment.blog
  end

  # Handles HTTP PUT/PATCH
  #
  # @param id [Integer] the id of the requested blog comment
  # @return [BlogComment] the updated blog comment object
  # @return [Hash] the flash notice
  def update
    authorize @blog_comment
    if @blog_comment.update(blog_comment_params)
      flash[:success] = 'Blog comment updated'
      redirect_to @blog_comment
    else
      @blog = Blog.find(params[:blog_comment][:blog_id])
      flash[:error] = 'There were problems'
      render :edit
    end
  end

  # Handles HTTP DELETE
  #
  # @param id [Integer] the id of the requested blog comment
  # @return [BlogComment] the cached blog comment that was deleted
  # @return [Hash] the flash notice
  def destroy
    authorize @blog_comment
    @blog_comment.destroy
    flash[:success] = 'Blog comment destroyed'
    redirect_to blog_comments_path
  end

  private

  # Finds [BlogComment] and sents it to and instance variable
  # @param id [Integer] the id of the requested blog comment
  def blog_comment
    @blog_comment = BlogComment.find(params[:id])
  end

  # The whitelist of attributes allowed to be submitted to a blog comment
  def blog_comment_params
    params.require(:blog_comment).permit(:blog_id, :name, :body, :email)
  end
end
