require 'rails_helper'

describe BlogCommentsController do
  describe 'GET index' do
    it 'sets @blog_comments' do
      comment1 = Fabricate :blog_comment
      comment2 = Fabricate :blog_comment
      get :index
      expect(assigns[:blog_comments]).to eq [comment1, comment2]
    end
  end
  
  describe 'GET show' do
    let(:blog_comment) {Fabricate :blog_comment}
    it 'sets @blog_comment' do
      get :show, id: blog_comment.id
      expect(assigns[:blog_comment]).to eq blog_comment
    end
  end
  
  describe 'GET new' do
    let(:blog) {Fabricate :blog}
    before {get :new, blog_id: blog.id}
    it 'sets @blog_comment' do
      expect(assigns[:blog_comment]).to be_instance_of BlogComment
    end
    
    it 'sets @blog' do
      expect(assigns[:blog]).to eq blog
    end
  end
  
  describe 'POST create' do
    context 'a successful http creation' do
      before {post :create, blog_comment: Fabricate.attributes_for(:blog_comment)}
      
      it 'redirects_to :show' do
        expect(response).to redirect_to BlogComment.first
      end
      
      it 'sets @blog_comment' do
        expect(assigns[:blog_comment]).to be_instance_of BlogComment
      end
      
      it 'sets flash[:success]' do
        expect(flash[:success]).to_not be_nil
      end
    end
    
    context 'a successful xhr creation' do
      before {xhr :post, :create, blog_comment: Fabricate.attributes_for(:blog_comment)}
      it 'sets @blog_comment' do
        expect(assigns[:blog_comment]).to be_instance_of BlogComment
      end
    end
    
    context 'an unsuccessful creation' do
      let(:blog){Fabricate :blog}
      before {post :create, blog_comment: {blog_id: blog.id, name: nil, body: Faker::Lorem.words(30).join("\s")}}
      
      it 'renders :new' do
        expect(response).to render_template :new
      end
      
      it 'sets @blog_comment' do
        expect(assigns[:blog_comment]).to be_instance_of BlogComment
      end
      
      it 'sets flash[:error]' do
        expect(flash[:error]).to_not be_nil
      end
    end
  end
  
  describe 'GET edit' do
    let(:blog_comment) {Fabricate :blog_comment}
    before {get :edit, id: blog_comment.id}
    it 'sets @blog_comment' do
      expect(assigns[:blog_comment]).to eq blog_comment
    end
    
    it 'sets @blog' do
      expect(assigns[:blog]).to eq blog_comment.blog
    end
  end
  
  describe 'PUT update' do
    let(:blog_comment) {Fabricate :blog_comment}
    context 'a successful update' do
      before{put :update, id: blog_comment.id, blog_comment: {body: text(10)}}
      it 'redirects to :show' do
        expect(response).to redirect_to blog_comment
      end
      
      it 'sets @blog_comment' do
        expect(assigns[:blog_comment]).to eq blog_comment
      end
      
      it 'sets flash[:success]' do
        expect(flash[:success]).to_not be_nil
      end
    end
    context 'an unsuccessful update' do
      before{put :update, id: blog_comment.id, blog_comment: {blog_id: blog_comment.blog.id, body: nil}}
      
      it 'renders :edit' do
        expect(response).to render_template :edit
      end
      
      it 'sets @blog_comment' do
        expect(assigns[:blog_comment]).to eq blog_comment
      end
      
      it 'sets flash[:error]' do
        expect(flash[:error]).to_not be_nil
      end
    end
  end
  
  describe 'DELETE destroy' do
    let(:blog_comment) {Fabricate :blog_comment}
    before {delete :destroy, id: blog_comment.id}
    
    it 'redirects to :index' do
      expect(response).to redirect_to blog_comments_path
    end
    
    it 'sets @blog_comment' do
      expect(assigns[:blog_comment]).to eq blog_comment
    end
    
    it 'removes the blog comment' do
      expect(BlogComment.where(id: blog_comment.id)).to eq []
    end
    
    it 'sets flash[:message]' do
      expect(flash[:success]).to_not be_nil
    end
  end
end