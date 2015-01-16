require 'rails_helper'

describe ContactMesController do
  describe 'GET index' do
    before do
      2.times{Fabricate(:contact_me)}
    end
    
    it 'sets @contact_mes' do
      get :index
      expect(assigns[:contact_mes].size).to eq 2
    end
  end
  
  describe 'POST create' do
    context 'HTTP request' do
      it 'sets @contact_me' do
        post :create, contact_me: {email: Faker::Internet.email, name: Faker::Name.name, body: Faker::Lorem.words(5).join("\s")}
        expect(assigns[:contact_me]).to be_instance_of ContactMe
      end
      
      describe 'successfully created contact me' do
        before {post :create, contact_me: {email: Faker::Internet.email, name: Faker::Name.name, body: Faker::Lorem.words(5).join("\s")}
  }
        it 'sets flash[:success]' do
          expect(flash[:success]).to_not be_nil
        end
        
        it 'redirects to root path' do
          expect(response).to redirect_to root_path
        end
      end
      
      describe 'unsuccessfully created contact me' do
        before {post :create, contact_me: {name: Faker::Name.name, body: Faker::Lorem.words(5).join("\s")}
  }
        it 'sets flash[:error]' do
          expect(flash[:error]).to_not be_nil
        end
        
        it 'redirects to root path' do
          expect(response).to redirect_to root_path
        end
      end
    end
    
    context 'xhr request' do
      it 'sets @contact_me' do
        xhr :post, :create, contact_me: {email: Faker::Internet.email, name: Faker::Name.name, body: Faker::Lorem.words(5).join("\s")}
        expect(assigns[:contact_me]).to be_instance_of ContactMe
      end
      
      describe 'successfully created contact me' do
        it 'sets flash[:success]' do
          xhr :post, :create, contact_me: {email: Faker::Internet.email, name: Faker::Name.name, body: Faker::Lorem.words(5).join("\s")}
          expect(flash[:success]).to_not be_nil
        end
      end
      
      describe 'successfully created contact me' do
        it 'sets flash[:success]' do
          xhr :post, :create, contact_me: {email: Faker::Internet.email, body: Faker::Lorem.words(5).join("\s")}
          expect(flash[:error]).to_not be_nil
        end
      end
    end
  end
  
  describe 'GET show' do
    it 'sets @contact_me' do
      contact_me = Fabricate :contact_me
      get :show, id: contact_me.id
      expect(assigns[:contact_me]).to be_instance_of ContactMe
    end
  end
end