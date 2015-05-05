class BlogFilesController < ApplicationController
  before_action :blog_file, only: [:show, :edit, :update, :destroy, :download]
  before_action :require_user
  before_action :require_admin
  def index
    @q = BlogFile.ransack(params[:q])
    @blog_files = @q.result.paginate(:page => params[:page], :per_page => 20)
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
    blog = @blog_file.blog
    @blog_file.destroy

    flash[:success] = 'Blog file deleted'
    redirect_to blog
  end
  
  def download
    send_file(@blog_file.document.path, type: @blog_file.document_content_type, x_sendfile: true) if File.exists? @blog_file.document.path
  end
  
  private
  
  def blog_file
    @blog_file = BlogFile.find(params[:id])
  end
  
  def blog_file_params
    params.require(:blog_file).permit(:blog_id, :doc, :blog_description, :created_by, :updated_by)
  end
end
