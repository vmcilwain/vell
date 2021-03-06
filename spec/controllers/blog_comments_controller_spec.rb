require 'rails_helper'

describe BlogCommentsController do
  let(:user) {Fabricate :user, admin: true}

  describe 'GET index' do
    let(:comments) {[]}

    before do
      comments << Fabricate(:blog_comment)
      sign_in user
      get :index
    end

    it_behaves_like 'requires sign in' do
      let(:action) {get :index}
    end

    it 'sets @blog_comments' do
      expect(assigns[:blog_comments].results).to eq comments
    end
  end

  describe 'GET show' do
    let(:blog_comment) {Fabricate :blog_comment}

    before {get :show, params: {id: blog_comment.id}}

    it_behaves_like 'requires sign in' do
      let(:action) {get :show, params: {id: blog_comment.id}}
    end

    it 'sets @blog_comment' do
      expect(assigns[:blog_comment]).to eq blog_comment
    end
  end

  describe 'GET new' do
    let(:blog) {Fabricate :blog}

    before {get :new, params: {blog_id: blog.id}}

    it 'sets @blog_comment' do
      expect(assigns[:blog_comment]).to be_instance_of BlogComment
    end

    it 'sets @blog' do
      expect(assigns[:blog]).to eq blog
    end
  end

  describe 'POST create' do
    after {clear_mailbox}

    context 'a successful http creation' do
      before {post :create, params: {blog_comment: Fabricate.attributes_for(:blog_comment)}}

      it 'redirects_to :show' do
        expect(response).to redirect_to BlogComment.first
      end

      it 'sets @blog_comment' do
        expect(assigns[:blog_comment]).to be_instance_of BlogComment
      end

      it 'sets flash[:success]' do
        expect(flash[:success]).to_not be_nil
      end

      it 'sends an email' do
        expect(mailbox.size).to eq 1
      end
    end

    context 'a successful xhr creation' do
      before {post :create, xhr: true, params: {blog_comment: Fabricate.attributes_for(:blog_comment)}}

      it 'sets @blog_comment' do
        expect(assigns[:blog_comment]).to be_instance_of BlogComment
      end

      it 'sends an email' do
        expect(mailbox.size).to eq 1
      end
    end

    context 'an unsuccessful creation' do
      let(:blog){Fabricate :blog}

      before {post :create, params: {blog_comment: {blog_id: blog.id, name: nil, body: Faker::Lorem.words(30).join("\s")}}}

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

    before do
      sign_in user
      get :edit, params: {id: blog_comment.id}
    end

    it_behaves_like 'requires sign in' do
      let(:action) {get :edit, params: {id: blog_comment.id}}
    end

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
      before do
        sign_in user
        put :update, params: {id: blog_comment.id, blog_comment: {body: text(10)}}
      end

      it_behaves_like 'requires sign in' do
        let(:action) {put :update, params: {id: blog_comment.id, body: text(10)}}
      end

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
      before do
        sign_in user
        put :update, params: {id: blog_comment.id, blog_comment: {blog_id: blog_comment.blog.id, body: nil}}
      end

      it_behaves_like 'requires sign in' do
        let(:action) {put :update, params: {id: blog_comment.id, blog_comment: {blog_id: blog_comment.blog.id, body: nil}}}
      end

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

    before do
      sign_in user
      delete :destroy, params: {id: blog_comment.id}
    end

    # have to figure out how to test this, object gets deleted before test can run
    # it_behaves_like 'requires sign in' do
    #   let(:action) {delete :destroy, id: blog_comment.id}
    # end

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
