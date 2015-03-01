class PhotosController < ApplicationController
  before_action :photo, only: [:show, :edit, :update]
  
  def index
    @photos = Photo.all
  end
  
  def new
    @photo = Photo.new
  end
  
  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      flash[:success] = 'Photo created'
      redirect_to @photo
    else
      flash[:error] = 'There were errors'
      render :new
    end
  end
  
  def update
    if @photo.update(photo_params)
      flash[:success] = 'Photo updated'
      redirect_to @photo
    else
      flash[:error] = 'There were errors'
      render :edit
    end
  end
  private
  
  def photo
    @photo = Photo.find(params[:id])
  end
  
  def photo_params
    params.require(:photo).permit(:document, :description, :photo_album_id)
  end
end