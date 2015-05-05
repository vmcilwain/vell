require 'rails_helper'

describe HomeController do
  # describe 'GET index' do
  #   it 'sets @index' do
  #     Fabricate :home
  #     get :index
  #     expect(assigns[:home]).to_not be_nil
  #   end
  # end
  #
  # describe 'GET about' do
  #   it 'sets @about' do
  #     Fabricate :home
  #     get :about
  #     expect(assigns[:home]).to_not be_nil
  #   end
  # end
  #
  # describe 'GET new' do
  #   let(:user) {Fabricate :user}
  #
  #   before do
  #     add_user_to_role(user, 'administrator')
  #     session[:user_id] = user.id
  #   end
  #
  #   it 'sets @home' do
  #     get :new
  #     expect(assigns[:home]).to be_instance_of Home
  #   end
  # end
  #
  # describe 'GET edit' do
  #   it 'sets @home' do
  #     home = Fabricate :home
  #     get :edit, id: home.id
  #     expect(assigns[:home]).to eq home
  #   end
  # end
  #
  # describe 'POST create' do
  #   context 'a successful creation' do
  #     let(:user) {Fabricate :user}
  #
  #     before do
  #       add_user_to_role(user, 'administrator')
  #       session[:user_id] = user.id
  #       post :create, home: {index: Faker::Lorem.words(5).join("\s"), about: Faker::Lorem.words(5).join("\s")}
  #     end
  #
  #     it 'sets @home' do
  #       expect(assigns[:home]).to be_instance_of Home
  #     end
  #
  #     it 'sets flash[:success]' do
  #       expect(flash[:success]).to_not be_nil
  #     end
  #
  #     it 'redirects to root path' do
  #       expect(response).to redirect_to root_path
  #     end
  #   end
  # end
end