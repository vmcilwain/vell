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
    context 'successful creation'
    context 'unsuccesful creation'
  end
  describe 'GET edit'
  describe 'PUT update' do
    context 'successful update'
    context 'unsuccessful update'
  end
  describe 'DELETE destroy'
end