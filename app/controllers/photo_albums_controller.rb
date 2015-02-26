class PhotoAlbumsController < ApplicationController
  before_action :photo_album, only: [:show]
  
  def index
    @photo_albums = PhotoAlbum.all
  end
  
  def new
    @photo_album = PhotoAlbum.new
  end
  
  private
  
  def photo_album
    @photo_album = PhotoAlbum.find(params[:id])
  end
end