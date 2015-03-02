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
  describe 'GET edit'
  describe 'PUT update' do
    context 'successful update'
    context 'unsuccessful update'
  end
  describe 'DELETE destroy'
end