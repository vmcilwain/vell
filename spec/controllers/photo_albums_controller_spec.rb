# require 'rails_helper'
#
# describe PhotoAlbumsController do
#   describe 'GET index' do
#     it 'sets @photo_albums' do
#       photo_album_1 = Fabricate :photo_album
#       photo_album_2 = Fabricate :photo_album
#       get :index
#       expect(assigns[:photo_albums]).to eq [photo_album_1, photo_album_2]
#     end
#   end
#
#   describe 'GET show' do
#     let(:photo_album) {Fabricate :photo_album}
#     it 'sets @photo_album' do
#       get :show, id: photo_album.id
#       expect(assigns[:photo_album]).to eq photo_album
#     end
#   end
#
#   describe 'GET new' do
#     let(:user) {Fabricate :user}
#
#     before do
#       add_user_to_role(user, 'administrator')
#       session[:user_id] = user.id
#     end
#
#     it 'sets @photo_album' do
#       get :new
#       expect(assigns[:photo_album]).to be_instance_of PhotoAlbum
#     end
#   end
#
#   describe 'POST create' do
#     let(:user) {Fabricate :user}
#     context 'a successful creation' do
#       let(:photo_album_attrs) {Fabricate.attributes_for :photo_album}
#
#       before do
#         add_user_to_role(user, 'administrator')
#         session[:user_id] = user.id
#         post :create, photo_album: photo_album_attrs
#       end
#
#       it 'redirects to :show' do
#         expect(response).to redirect_to photo_album_path(PhotoAlbum.last)
#       end
#
#       it 'sets @photo_album' do
#         expect(assigns[:photo_album]).to be_instance_of PhotoAlbum
#       end
#
#       it 'it sets flash[:success]' do
#         expect(flash[:success]).to_not be_nil
#       end
#     end
#
#     context 'an unsuccesful creation' do
#       before do
#         add_user_to_role(user, 'administrator')
#         session[:user_id] = user.id
#         post :create, photo_album: {description: text}
#       end
#
#       it 'renders :new' do
#         expect(response).to render_template :new
#       end
#
#       it 'sets @photo_album' do
#         expect(assigns[:photo_album]).to be_instance_of PhotoAlbum
#       end
#       it 'sets flash[:error]' do
#         expect(flash[:error]).to_not be_nil
#       end
#     end
#   end
#
#   describe 'GET edit' do
#     let(:photo_album) {Fabricate :photo_album}
#     let(:user) {Fabricate :user}
#
#     before do
#       add_user_to_role(user, 'administrator')
#       session[:user_id] = user.id
#     end
#
#     it 'sets @photo_album' do
#       get :edit, id: photo_album.id
#       expect(assigns[:photo_album]).to eq photo_album
#     end
#   end
#
#   describe 'PUT update' do
#     let(:photo_album) {Fabricate :photo_album}
#     let(:user) {Fabricate :user}
#     context 'a successful update' do
#       before do
#         add_user_to_role(user, 'administrator')
#         session[:user_id] = user.id
#         put :update, id: photo_album.id, photo_album: {name: Faker::Lorem.words(5).join("\s")}
#       end
#
#       it 'redirects_to :show' do
#         expect(response).to redirect_to photo_album_path(PhotoAlbum.last)
#       end
#
#       it 'sets @photo_album' do
#         expect(assigns[:photo_album]).to eq photo_album
#       end
#
#       it 'sets flash[:success]' do
#         expect(flash[:success]).to_not be_nil
#       end
#     end
#
#     context 'an unsuccessful update' do
#       let(:photo_album) {Fabricate :photo_album}
#       before do
#         add_user_to_role(user, 'administrator')
#         session[:user_id] = user.id
#         put :update, id: photo_album.id, photo_album: {name: nil}
#       end
#
#       it 'renders :edit' do
#         expect(response).to render_template :edit
#       end
#
#       it 'sets @photo_album' do
#         expect(assigns[:photo_album]).to eq photo_album
#       end
#
#       it 'sets flash[:error]' do
#         expect(flash[:error]).to_not be_nil
#       end
#     end
#   end
#
#   describe 'DELETE destroy' do
#     let(:photo_album) {Fabricate :photo_album}
#     let(:user) {Fabricate :user}
#     before do
#       add_user_to_role(user, 'administrator')
#       session[:user_id] = user.id
#       delete :destroy, id: photo_album.id
#     end
#
#     it 'redirects_to :index' do
#       expect(response).to redirect_to photo_albums_path
#     end
#
#     it 'sets @photo_album' do
#       expect(assigns[:photo_album]).to eq photo_album
#     end
#
#     it 'removes the record' do
#       expect(PhotoAlbum.where(id: photo_album.id)).to eq []
#     end
#
#     it 'sets flash[:success]' do
#       expect(flash[:success]).to_not be_nil
#     end
#   end
# end