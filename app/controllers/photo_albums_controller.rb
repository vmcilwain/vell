class PhotoAlbumsController < ApplicationController
  before_action :photo_album, only: [:show, :edit, :update, :destroy]
  
  def index
    @q = PhotoAlbum.ransack(params[:q])
    @photo_albums = @q.result.paginate(:page => params[:page], :per_page => 12)
  end
  
  def show
    @photos = @photo_album.photos
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