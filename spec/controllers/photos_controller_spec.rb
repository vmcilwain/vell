require 'rails_helper'

describe PhotosController do
  after {delete_files}
  
   describe 'GET index' do
    it 'sets @photos' do
      photo1 = Fabricate :photo
      photo2 = Fabricate :photo
      get :index
      expect(assigns(:photos)).to eq [photo1, photo2]
    end
  end
  
  describe 'GET show' do
    let(:photo) {Fabricate :photo}
    
    before {get :show, id: photo.id}
    
    it 'sets @photo' do
      expect(assigns(:photo)).to eq photo
    end
  end
  
  describe 'GET new' do
    it 'sets @photo' do
      get :new
      expect(assigns[:photo]).to be_instance_of Photo
    end
  end
  
  describe 'POST create' do
    require 'rack/test'
    
    context 'successful creation' do
      before {post :create, photo: {photo_album_id: 1, document: file_to_upload(test_picture, "image/jpg")}}
      
      it 'redirects to :show' do
        expect(response).to redirect_to photo_path(Photo.last)
      end
      
      it 'sets @photo' do
        expect(assigns[:photo]).to be_instance_of Photo
      end
      
      it 'sets flash[:success]' do
        expect(flash[:success]).to_not be_nil
      end
    end
    
    context 'unsuccesful creation' do
      before {post :create, photo: {document: file_to_upload(test_picture, "image/jpg")}}
      
      it 'renders :new' do
        expect(response).to render_template :new
      end
      
      it 'sets @photo' do
        expect(assigns[:photo]).to be_instance_of Photo
      end
      
      it 'sets flash[:error]' do
        expect(flash[:error]).to_not be_nil
      end
    end
  end
  
  describe 'GET edit' do
    let(:photo) {Fabricate :photo}
    before {get :edit, id: photo.id}
    
    it 'sets @photo' do
      expect(assigns[:photo]).to eq photo
    end
  end
  
  describe 'PUT update' do
    context 'successful update'
    context 'unsuccessful update'
  end
  describe 'DELETE destroy'
end