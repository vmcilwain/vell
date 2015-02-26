class PhotoAlbumsController < ApplicationController
  before_action :photo_album, only: [:show]
  
  def index
    @photo_albums = PhotoAlbum.all
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
  
  private
  
  def photo_album
    @photo_album = PhotoAlbum.find(params[:id])
  end
  
  def photo_album_params
    params.require(:photo_album).permit(:name, :description)
  end
end