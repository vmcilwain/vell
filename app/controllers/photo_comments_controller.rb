class PhotoCommentsController < ApplicationController
  before_action :photo_comment, only: [:show]
  def index
    @photo_comments = PhotoComment.all
  end
  
  def new
    @photo_comment = PhotoComment.new
  end
  
  private
  
  def photo_comment
    @photo_comment = PhotoComment.find(params[:id])
  end
end