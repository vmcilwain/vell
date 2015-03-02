require 'rails_helper'

describe PhotoCommentsController do
  after {delete_files}
  describe 'GET index' do
    it 'sets @photo_comments' do
      comment1 = Fabricate :photo_comment
      comment2 = Fabricate :photo_comment
      get :index
      expect(assigns[:photo_comments]).to eq [comment1, comment2]
    end
  end
  
  describe 'GET show' do
    let(:photo_comment) {Fabricate :photo_comment}
    it 'sets @photo_comment' do
      get :show, id: photo_comment.id
      expect(assigns[:photo_comment]).to eq photo_comment
    end
  end
  
  describe 'GET new' do
    it 'sets @photo_comment' do
      get :new
      expect(assigns[:photo_comment]).to be_instance_of PhotoComment
    end
  end
  
  describe 'POST create' do
    context 'successful creation'do
      let(:photo_comment_attrs) {Fabricate.attributes_for :photo_comment}
      before {post :create, photo_comment: photo_comment_attrs}
    
      it 'redirects to :show' do
        expect(response).to redirect_to photo_path(PhotoComment.last.photo)
      end
    
      it 'sets @photo_comment' do
        expect(assigns[:photo_comment]).to be_instance_of PhotoComment
      end
    
      it 'sets flash[:success]' do
        expect(flash[:success]).to_not be_nil
      end
    end
    
    context 'unsuccesful creation' do
      before {post :create, photo_comment: {blog_id: 1, name: Faker::Name.name, headline: text, body: nil}}
      
      it 'renders :new' do
        expect(response).to render_template :new
      end
      
      it 'sets @photo_comment' do
        expect(assigns[:photo_comment]).to be_instance_of PhotoComment
      end
      
      it 'sets flash[:error]' do
        expect(flash[:error]).to_not be_nil
      end
    end
  end
  
  describe 'GET edit' do
    let(:photo_comment) {Fabricate :photo_comment}
    
    it 'sets @photo_comment' do
      get :edit, id: photo_comment.id
      expect(assigns[:photo_comment]).to eq photo_comment
    end
  end
  
  describe 'PUT update' do
    let(:photo_comment) {Fabricate :photo_comment}
    
    context 'successful update' do
      before {put :update, id: photo_comment.id, photo_comment: {name: Faker::Name.name}}
      
      it 'redirects to :show' do
        expect(response).to redirect_to photo_path(photo_comment.photo)
      end
      
      it 'sets @photo_comment' do
        expect(assigns[:photo_comment]).to eq photo_comment
      end
      
      it 'sets flash[:success]' do
        expect(flash[:success]).to_not be_nil
      end
    end
    
    context 'unsuccessful update' do
      before {put :update, id: photo_comment.id, photo_comment: {body: nil}}
      
      it 'renders :edit' do
        expect(response).to render_template :edit
      end
      
      it 'sets @photo_comment' do
        expect(assigns[:photo_comment]).to eq photo_comment
      end
      
      it 'sets flash[:error]' do
        expect(flash[:error]).to_not be_nil
      end
    end
  end
  
  describe 'DELETE destroy' do
    let(:photo_comment) {Fabricate :photo_comment}
    before {delete :destroy, id: photo_comment.id}
    
    it 'redirects to :index' do
      expect(response).to redirect_to photo_comments_path
    end
    
    it 'sets @photo_comment' do
      expect(assigns[:photo_comment]).to eq photo_comment
    end
    
    it 'removes the record' do
      expect(PhotoComment.where(id: photo_comment.id)).to eq []
    end
    
    it 'sets flash[:success]' do
      expect(flash[:success]).to_not be_nil
    end
  end
end