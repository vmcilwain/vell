# @author Lovell McIlwain
# Handles HTTP actions for blog
class BlogsController < ApplicationController
  # Before action to prompt for authentication
  # @note uses devise gem
  before_action :authenticate_user!, except: [:index, :show]

  # Before action to load a blog
  # (see #blog)
  before_action :blog, only: [:show, :edit, :update, :destroy]

  # Handles HTTP GET
  #
  # @param tag [String] the tag name to search for
  # @return [Array] the list of blogs found
  def index
    authorize Blog
    if params[:tag]
      @blogs = Blog.tagged_with(params[:tag]).paginate(page: params[:page], per_page: 5, order: {created_at: :desc})
    else
      @blogs = Blog.search(params.fetch(:q, "*"), page: params[:page], per_page: 5, order: {created_at: :desc}) #elasticsearch
    end
  end

  # Handles HTTP GET
  #
  # @return [Blog] a new blog object
  # @note returns 3 associated blog file builds for nested attributes
  def new
    authorize Blog
    @blog = Blog.new
    3.times {@blog.blog_files.build}
  end

  # Handles HTTP POST
  #
  # @param blog [Hash] the submitted attributes
  # (see #blog_params)
  # @return [Blog] the created blog
  # @return [Hash] the flash notice
  # @note updates twitter account if to_twitter is set to true
  def create
    authorize Blog
    @blog = Blog.new(blog_params)
    if @blog.save
      # @status, @message = TwitterService.new(@blog).update if @blog.to_twitter
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

  # Handles HTTP PUT/PATCH
  #
  # @param blog [Hash] the updated attributes
  # (see #blog_params)
  # @param id [Integer] the id of the blog to be updated
  # (see #blog)
  # @return [Blog] the updated blog object
  # @return [Hash] the flash notice
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

  # Handles HTTP DELETE
  #
  # @param id [Integer] the id of the blog requested
  # (see #blog)
  # @return [Blog] the cached blog object after deletion
  # @ return [Hash] the flash notice
  def destroy
    authorize @blog
    @blog.destroy
    flash[:success] = 'Blog deleted!'
    redirect_to blogs_path
  end

  private

  # Find blog record and set to an instance variable
  # @param id [Integer] the id of the requested blog
  # @return [Blog] the blog object found
  def blog
    @blog = Blog.friendly.find(params[:id])
  end

  # The whitelist of attributes allwed to be submitted to blog
  def blog_params
    params.require(:blog).permit(:headline, :body, :to_twitter, :tag_list, blog_files_attributes: [:id, :blog_id, :description, :doc])
  end
end
