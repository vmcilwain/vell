class PhotoCommentsController < ApplicationController
  before_action :photo_comment, only: [:show]
  def index
    @photo_comments = PhotoComment.all
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
  
  private
  
  def photo_comment
    @photo_comment = PhotoComment.find(params[:id])
  end
  
  def photo_comment_params
    params.require(:photo_comment).permit(:photo_id, :name, :headline, :body)
  end
end