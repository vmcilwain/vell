# require 'rails_helper'
#
# describe PhotosController do
#   after {delete_files}
#
#    describe 'GET index' do
#     let(:user) {Fabricate :user}
#
#     before do
#      add_user_to_role(user, 'administrator')
#      session[:user_id] = user.id
#     end
#
#     it 'sets @photos' do
#       photo1 = Fabricate :photo
#       photo2 = Fabricate :photo
#       get :index
#       expect(assigns(:photos)).to eq [photo1, photo2]
#     end
#   end
#
#   describe 'GET show' do
#     let(:photo) {Fabricate :photo}
#     let(:user) {Fabricate :user}
#
#     before do
#       add_user_to_role(user, 'administrator')
#       session[:user_id] = user.id
#       get :show, id: photo.id
#     end
#
#     it 'sets @photo' do
#       expect(assigns(:photo)).to eq photo
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
#     it 'sets @photo' do
#       get :new
#       expect(assigns[:photo]).to be_instance_of Photo
#     end
#   end
#
#   describe 'POST create' do
#     require 'rack/test'
#     let(:user) {Fabricate :user}
#     context 'successful creation' do
#       before do
#         add_user_to_role(user, 'administrator')
#         session[:user_id] = user.id
#         post :create, photo: {photo_album_id: 1, document: file_to_upload(test_picture, "image/jpg")}
#       end
#
#       it 'redirects to :show' do
#         expect(response).to redirect_to photo_path(Photo.last)
#       end
#
#       it 'sets @photo' do
#         expect(assigns[:photo]).to be_instance_of Photo
#       end
#
#       it 'sets flash[:success]' do
#         expect(flash[:success]).to_not be_nil
#       end
#     end
#
#     context 'unsuccesful creation' do
#       let(:user) {Fabricate :user}
#       before do
#         add_user_to_role(user, 'administrator')
#         session[:user_id] = user.id
#         post :create, photo: {document: file_to_upload(test_picture, "image/jpg")}
#       end
#
#       it 'renders :new' do
#         expect(response).to render_template :new
#       end
#
#       it 'sets @photo' do
#         expect(assigns[:photo]).to be_instance_of Photo
#       end
#
#       it 'sets flash[:error]' do
#         expect(flash[:error]).to_not be_nil
#       end
#     end
#   end
#
#   describe 'GET edit' do
#     let(:photo) {Fabricate :photo}
#     let(:user) {Fabricate :user}
#     before do
#       add_user_to_role(user, 'administrator')
#       session[:user_id] = user.id
#       get :edit, id: photo.id
#     end
#
#     it 'sets @photo' do
#       expect(assigns[:photo]).to eq photo
#     end
#   end
#
#   describe 'PUT update' do
#     require 'rack/test'
#     let(:photo) {Fabricate :photo}
#     let(:user) {Fabricate :user}
#     context 'successful update' do
#
#       before do
#         add_user_to_role(user, 'administrator')
#         session[:user_id] = user.id
#         put :update, id: photo.id, photo: {description: Faker::Lorem.words(5).join("\s")}
#       end
#
#       it 'redirects to :show' do
#         expect(response).to redirect_to photo_path(photo)
#       end
#
#       it 'sets @photo' do
#         expect(assigns[:photo]).to eq photo
#       end
#
#       it 'sets flash[:success]' do
#         expect(flash[:success]).to_not be_nil
#       end
#     end
#
#     context 'unsuccessful update' do
#       before do
#         add_user_to_role(user, 'administrator')
#         session[:user_id] = user.id
#         put :update, id: photo.id, photo: {photo_album_id: nil}
#       end
#
#       it 'redirects to :edit' do
#         expect(response).to render_template :edit
#       end
#
#       it 'sets @photo' do
#         expect(assigns[:photo]).to eq photo
#       end
#
#       it 'sets flash[:error]' do
#         expect(flash[:error]).to_not be_nil
#       end
#     end
#   end
#
#   describe 'DELETE destroy' do
#     let(:photo) {Fabricate :photo}
#     let(:user) {Fabricate :user}
#
#     before do
#       add_user_to_role(user, 'administrator')
#       session[:user_id] = user.id
#       delete :destroy, id: photo.id
#     end
#
#     it 'redirects to photo album' do
#       expect(response).to redirect_to photo_album_path(photo.photo_album)
#     end
#
#     it 'sets @photo' do
#       expect(assigns[:photo]).to eq photo
#     end
#
#     it 'removes the record from the db' do
#       expect(Photo.where(id: photo.id)).to eq []
#     end
#
#     it 'sets flash[:success]' do
#       expect(flash[:success]).to_not be_nil
#     end
#   end
# end