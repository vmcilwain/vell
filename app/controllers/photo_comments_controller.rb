class PhotoCommentsController < ApplicationController
  before_action :photo_comment, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:new, :create]
  before_action :require_admin, except: [:new, :create]
  def index
    @q = PhotoComment.ransack(params[:q])
    @photo_comments = @q.result.paginate(:page => params[:page], :per_page => 20)
  end
  
  def new
    @photo_comment = PhotoComment.new
  end
  
  def create
    @photo_comment = PhotoComment.new(photo_comment_params)
    if @photo_comment.save
      flash[:success] = 'Photo comment created'
      redirect_to @photo_comment.photo
    else
      flash[:error] = 'There were errors'
      render :new
    end
  end
  
  def update
    if @photo_comment.update(photo_comment_params)
      flash[:success] = 'Photo comment updated'
      redirect_to @photo_comment.photo
    else
      flash[:error] = 'There were errors'
      render :edit
    end
  end
  
  def destroy
    @photo_comment.destroy
    flash[:success] = 'Photo comment destroyed'
    redirect_to photo_comments_path
  end
  
  private
  
  def photo_comment
    @photo_comment = PhotoComment.find(params[:id])
  end
  
  def photo_comment_params
    params.require(:photo_comment).permit(:photo_id, :name, :headline, :body)
  end
end