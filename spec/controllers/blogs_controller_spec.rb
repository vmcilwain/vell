require 'rails_helper'

describe BlogsController do
  let(:user) {Fabricate :user}
  let(:blog) {Fabricate :blog}

  describe 'GET index' do
    before {blog}
    it 'sets @blogs' do
      get :index
      expect(assigns[:blogs]).to_not be_nil
    end
  end

  describe 'GET show' do
    before {get :show, params: {id: blog.id}}

    it 'sets @blog' do
      expect(assigns[:blog]).to eq blog
    end
  end

  describe 'GET new' do
    before do
      user.update(admin: true)
      sign_in user
    end

    it 'sets @blog' do
      get :new
      expect(assigns[:blog]).to be_instance_of Blog
    end
  end

  describe 'POST create', :vcr do
    context 'a successful creation without a file without posting to twitter' do

      before do
        user.update(admin: true)
        sign_in user
        post :create, params: {blog: {headline: Faker::Lorem.words(5).join("\s"), body: Faker::Lorem.words(25).join("\s")}}
      end

      after {delete_files}

      it 'redirects to :show' do
        expect(response).to redirect_to Blog.first
      end

      it 'sets @blog' do
        expect(assigns[:blog]).to be_instance_of Blog
      end

      it 'sets flash[:success]' do
        expect(flash[:success]).to_not be_nil
      end

      it 'does not set @status' do
        expect(assigns[:status]).to be_nil
      end

      it 'does not set @message' do
        expect(assigns[:message]).to be_nil
      end
    end

    context 'a successful creation with a file without posting to twitter' do
      require 'rack/test'

      before do
        user.update(admin: true)
        sign_in user
        post :create, params: {blog: {headline: Faker::Lorem.words(5).join("\s"), body: Faker::Lorem.words(25).join("\s"), blog_files: [blog_document: file_to_upload(test_file, 'text/plain')]}}
      end

      it 'redirects to :show' do
        expect(response).to redirect_to Blog.first
      end

      it 'sets @blog' do
        expect(assigns[:blog]).to be_instance_of Blog
      end

      it 'sets flash[:success]' do
        expect(flash[:success]).to_not be_nil
      end

      it 'does not set @status' do
        expect(assigns[:status]).to be_nil
      end

      it 'does not set @message' do
        expect(assigns[:message]).to be_nil
      end
    end

    context 'an unsuccessful creation' do
      before do
        user.update(admin: true)
        sign_in user
        post :create, params: {blog: {body: Faker::Lorem.words(25).join("\s")}}
      end

      it 'renders :new' do
        expect(response).to render_template :new
      end

      it "sets @blog" do
        expect(assigns[:blog]).to be_instance_of Blog
      end

      it 'sets flash[:error]' do
        expect(flash[:error]).to_not be_nil
      end

      it 'does not set @status' do
        expect(assigns[:status]).to be_nil
      end

      it 'does not set @message' do
        expect(assigns[:message]).to be_nil
      end
    end

    context 'a successful creation without posting to twitter' do
      before do
        user.update(admin: true)
        sign_in user
        post :create, params: {blog: {headline: Faker::Lorem.words(10).join("\s"), body: Faker::Lorem.words(25).join("\s")}}
      end

      it 'renders :show' do
        expect(response).to redirect_to Blog.last
      end

      it "sets @blog" do
        expect(assigns[:blog]).to eq Blog.last
      end

      it 'sets flash[:success]' do
        expect(flash[:success]).to_not be_nil
      end
    end

    context 'a successful creation posting to twitter' do
      before do
        user.update(admin: true)
        sign_in user
        post :create, params: {blog: Fabricate.attributes_for(:blog, to_twitter: true)}
      end

      it 'renders :show' do
        expect(response).to redirect_to assigns[:blog]
      end

      it 'sets @blog' do
        expect(assigns[:blog]).to eq Blog.last
      end

      it 'sets @status' do
        expect(assigns[:status]).to_not be_nil
      end
      it 'sets @message' do
        expect(assigns[:message]).to_not be_nil
      end

      it 'sets flash[:success]' do
        expect(flash[:success]).to_not be_nil
      end
    end
  end

  describe 'GET edit' do
    let(:blog) {Fabricate :blog}

    it 'sets @blog' do
      get :edit, params: {id: blog.id}
      expect(assigns[:blog]).to eq blog
    end
  end

  describe 'PUT update' do
    let(:blog) {Fabricate :blog}

    context 'a succesful update without a file' do
      before do
        user.update(admin: true)
        sign_in user
        put :update, params: {id: blog.id, blog: {headline: Faker::Lorem.words(5).join("\s"), body: Faker::Lorem.words(25).join("\s")}}
      end

      it 'redirects to :show' do
        expect(response).to redirect_to blog_path(blog)
      end

      it 'sets @blog' do
        expect(assigns[:blog]).to eq blog
      end

      it 'sets flash[success]' do
        expect(flash[:success]).to_not be_nil
      end
    end

    context 'an unsuccessful update' do
      before do
        user.update(admin: true)
        sign_in user
        put :update, params: {id: blog.id, blog: {headline: Faker::Lorem.words(5).join("\s"), body: nil}}
      end

      it 'renders :new' do
        expect(response).to render_template :new
      end

      it 'sets @blog' do
        expect(assigns[:blog]).to eq blog
      end

      it 'sets flash[:error]' do
        expect(flash[:error]).to_not be_nil
      end
    end
  end

  describe 'DELETE destroy' do
    let(:blog) {Fabricate :blog}

    before do
      user.update(admin: true)
      sign_in user
      delete :destroy, params: {id: blog.id}
    end

    it 'sets @blog' do
      expect(assigns[:blog]).to eq blog
    end

    it 'destroys @blog' do
      expect(Blog.where(id: blog.id)).to eq []
    end

    it 'redirects to :index' do
      expect(response).to redirect_to blogs_path
    end

    it 'sets flash[:success]' do
      expect(flash[:success]).to_not be_nil
    end
  end
end
