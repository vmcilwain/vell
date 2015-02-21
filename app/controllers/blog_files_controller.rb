class BlogFilesController < ApplicationController
  before_action :blog_file, only: [:show, :edit, :update, :destroy]
  def index
    @blog_files = BlogFile.all
  end
  
  def new
    @blog_file = BlogFile.new
  end
  
  def create
    @blog_file = BlogFile.new(blog_file_params)
    if @blog_file.save
      flash[:success] = 'Blog file created'
      redirect_to @blog_file
    else
      flash[:error] = 'There were problems'
      render :new
    end
  end
  
  def update
    if @blog_file.update(blog_file_params)
      flash[:success] = 'Blog file updated'
      redirect_to @blog_file
    else
      flash[:error] = 'There were problems'
      render :edit
    end
  end
  
  def destroy
    @blog_file.destroy
    flash[:success] = 'Blog file deleted'
    redirect_to blog_files_path
  end
  
  private
  
  def blog_file
    @blog_file = BlogFile.find(params[:id])
  end
  
  def blog_file_params
    params.require(:blog_file).permit(:blog_id, :blog_document, :blog_description, :created_by, :updated_by)
  end
end