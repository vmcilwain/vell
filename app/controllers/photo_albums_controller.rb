class PhotoAlbumsController < ApplicationController
  before_action :photo_album, only: [:show, :edit, :update, :destroy]
  
  def index
    @photo_albums = PhotoAlbum.all
  end
  
  def show
    @photos = @photo_album.photos.in_groups_of(4, false)
  end
  
  def new
    @photo_album = PhotoAlbum.new
  end
  
  def create
    @photo_album = PhotoAlbum.new(photo_album_params)
    if @photo_album.save
      flash[:success] = 'Photo album created'
      redirect_to @photo_album
    else
      flash[:error] = 'There were errors'
      render :new
    end
  end
  
  def update
    if @photo_album.update(photo_album_params)
      flash[:success] = 'Photo album updated'
      redirect_to @photo_album
    else
      flash[:error] = 'There were errors'
      render :edit
    end
  end
  
  def destroy
    @photo_album.destroy
    flash[:success] = 'Photo album deleted'
    redirect_to photo_albums_path
  end
  
  private
  
  def photo_album
    @photo_album = PhotoAlbum.find(params[:id])
  end
  
  def photo_album_params
    params.require(:photo_album).permit(:name, :description)
  end
end