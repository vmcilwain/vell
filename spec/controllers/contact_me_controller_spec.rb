require 'rails_helper'

describe ContactMeController do
  describe 'GET index' do
    before do
      2.times{Fabricate(:contact_me)}
    end
    
    it 'sets @contact_mes' do
      get :index
      expect(assigns[:contact_mes].size).to eq 2
    end
  end
  
  describe 'Post create' do
    it 'sets @contact_me' do
      post :create, contact_me: {email: Faker::Internet.email, name: Faker::Name.name, body: Faker::Lorem.words(5).join("\s")}
      expect(assigns[:contact_me]).to be_instance_of ContactMe
    end
    describe 'successfully contact me' do
      before {post :create, contact_me: {email: Faker::Internet.email, name: Faker::Name.name, body: Faker::Lorem.words(5).join("\s")}
}
      it 'sets flash[:success]' do
        expect(flash[:success]).to_not be_nil
      end
      it 'redirects to root path'
    end
    describe 'unsuccessfully created contact me' do
      it 'sets flash[:error]'
      it 'redirects to root path'
    end
  end
end