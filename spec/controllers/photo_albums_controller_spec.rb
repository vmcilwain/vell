require 'rails_helper'

describe PhotoAlbumsController do
  describe 'GET index' do
    it 'sets @photo_albums' do
      photo_album_1 = Fabricate :photo_album
      photo_album_2 = Fabricate :photo_album
      get :index
      expect(assigns[:photo_albums]).to eq [photo_album_1, photo_album_2]
    end
  end
  
  describe 'GET show' do
    let(:photo_album) {Fabricate :photo_album}
    it 'sets @photo_album' do
      get :show, id: photo_album.id
      expect(assigns[:photo_album]).to eq photo_album
    end
  end
  
  describe 'GET new' do
    it 'sets @photo_album' do
      get :new
      expect(assigns[:photo_album]).to be_instance_of PhotoAlbum
    end
  end
  
  describe 'POST create' do
    context 'a successful creation' do
      
    end
    context 'an unsuccesful creation'
  end
  describe 'GET edit'
  describe 'PUT update' do
    context 'a successful update'
    context 'an unsuccessful update'
  end
  describe 'DELETE destroy'
end