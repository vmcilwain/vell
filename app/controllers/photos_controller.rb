class PhotosController < ApplicationController
  before_action :photo, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :require_admin
  
  def index
    @q = Photo.ransack(params[:q])
    @photos = @q.result.paginate(:page => params[:page], :per_page => 15)
  end
  
  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    respond_to do |format|
      if @photo.save
        flash[:success] = 'Photo created'
        format.html {redirect_to @photo}
        format.js {}
      else
        flash[:error] = 'There were errors'
        format.html {render :new}
        format.js {}
      end
    end
  end
  
  def update
    respond_to do |format|
      if @photo.update(photo_params)
        flash[:success] = 'Photo updated'
        format.html {redirect_to @photo}
        format.js {}
      else
        flash[:error] = 'There were errors'
        format.html {render :edit}
        format.js {}
      end
    end
  end
  
  def destroy
    photo_album = @photo.photo_album
    @photo.destroy
    flash[:success] = 'Photo destroyed'
    respond_to do |format|
      format.html {redirect_to photo_album}
      format.js {}
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