# @author Lovell McIlwain
# Handles HTTP actions for blog files
class BlogFilesController < ApplicationController
  layout 'layout2'
  # Before action to load blog file
  # (see #blog_file)
  before_action :blog_file, only: [:edit, :update, :destroy, :download]

  # Before action to prompt for authentication
  # @note uses devise gem
  before_action :authenticate_user!

  # Handles HTTP GET
  #
  # @return [Array] the list of blog files found
  def index
    authorize BlogFile
    @blog_files = BlogFile.search(params.fetch(:q, "*"), page: params[:page], per_page: 10) #elasticsearch
  end

  # Handles HTTP GET
  #
  # @return [BlogFile] a new blog file object
  def new
    authorize BlogFile
    @blog_file = BlogFile.new
    authorize @blog_file
  end

  # Handles HTTP POST
  #
  # @param blog_file [Hash] the submitted attributes
  # (see #blog_file_param)
  # @return [BlogFile] the created blog file
  # @return [Hash] the flash notice
  def create
    authorize BlogFile
    @blog_file = BlogFile.new(blog_file_params)
    if @blog_file.save
      flash[:success] = 'Blog file created'
      redirect_to @blog_file
    else
      flash[:error] = 'There were problems'
      render :new
    end
  end

  # Handles HTTP PUT/PATCH
  #
  # @param blog_file [Hash] the updated attributes
  # (see #blog_file_param)
  # @param id [Integer] the id of the blog file to be updated
  # (see #blog_file)
  # @return [Blogfile] the updated blog file object
  # @return [Hash] the flash notice
  def update
    authorize @blog_file
    if @blog_file.update(blog_file_params)
      flash[:success] = 'Blog file updated'
      redirect_to @blog_file
    else
      flash[:error] = 'There were problems'
      render :edit
    end
  end

  # Handles HTTP DELETE
  #
  # @param id [Integer] the id of the blog file requested
  # (see #blog_file)
  # @return [BlogFile] the cached blog file object after deletion
  # @ return [Hash] the flash notice
  def destroy
    authorize @blog_file
    blog = @blog_file.blog
    @blog_file.destroy

    flash[:success] = 'Blog file deleted'
    redirect_to blog
  end

  # Handles HTTP GET
  #
  # @param id [Integer] the blog file to be downloaded
  # (see #blog_file)
  # @return [BlogFile] the blog file object requested
  def download
    authorize @blog_file
    send_file(@blog_file.doc.path, type: @blog_file.doc_content_type, x_sendfile: true) if File.exists? @blog_file.doc.path
  end

  private

  # Find blog file record and set to an instance variable
  # @param id [Integer] the id of the requested blog file
  # @return [BlogFile] the blog file object found
  def blog_file
    @blog_file = BlogFile.find(params[:id])
  end

  # The whitelist of attributes allwed to be submitted to blog file
  def blog_file_params
    params.require(:blog_file).permit(:blog_id, :doc, :blog_description, :created_by, :updated_by)
  end
end
