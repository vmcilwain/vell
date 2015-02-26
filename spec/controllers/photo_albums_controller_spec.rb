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
      let(:photo_album_attrs) {Fabricate.attributes_for :photo_album}
      
      before {post :create, photo_album: photo_album_attrs}
      
      it 'redirects to :show' do
        expect(response).to redirect_to photo_album_path(PhotoAlbum.last)
      end
      
      it 'sets @photo_album' do
        expect(assigns[:photo_album]).to be_instance_of PhotoAlbum
      end
      
      it 'it sets flash[:success]' do
        expect(flash[:success]).to_not be_nil
      end
    end
    
    context 'an unsuccesful creation' do
      before {post :create, photo_album: {description: text}}
      
      it 'renders :new' do
        expect(response).to render_template :new
      end
      
      it 'sets @photo_album' do
        expect(assigns[:photo_album]).to be_instance_of PhotoAlbum
      end
      it 'sets flash[:error]' do
        expect(flash[:error]).to_not be_nil
      end
    end
  end
  describe 'GET edit'
  describe 'PUT update' do
    context 'a successful update'
    context 'an unsuccessful update'
  end
  describe 'DELETE destroy'
end