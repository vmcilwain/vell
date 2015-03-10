require 'rails_helper'

describe ContactMesController do
  describe 'GET index' do
    let(:user) {Fabricate :user}

    before do
      add_user_to_role(user, 'Administrator')
      session[:user_id] = user.id
      2.times{Fabricate(:contact_me)}
    end

    after {clear_mailbox}

    it 'sets @contact_mes' do
      get :index
      expect(assigns[:contact_mes].size).to eq 2
    end
  end
  
  describe 'GET new' do
    it 'sets @contact_me' do
      get :new
      expect(assigns[:contact_me]).to be_instance_of ContactMe
    end
  end

  describe 'POST create' do
    context 'HTTP request' do
      after {clear_mailbox}

      it 'sets @contact_me' do
        post :create, contact_me: {email: Faker::Internet.email, name: Faker::Name.name, body: Faker::Lorem.words(5).join("\s")}
        expect(assigns[:contact_me]).to be_instance_of ContactMe
      end

      describe 'successfully created contact me' do

        before {post :create, contact_me: {email: Faker::Internet.email, name: Faker::Name.name, body: Faker::Lorem.words(5).join("\s")}}

        after {clear_mailbox}

        it 'sets flash[:success]' do
          expect(flash[:success]).to_not be_nil
        end

        it 'redirects to root path' do
          expect(response).to redirect_to root_path
        end

        it 'sends an email' do
          expect(mailbox.count).to eq 1
        end
      end

      describe 'unsuccessfully created contact me' do
        before {post :create, contact_me: {name: Faker::Name.name, body: Faker::Lorem.words(5).join("\s")}
  }
        after {clear_mailbox}

        it 'sets flash[:error]' do
          expect(flash[:error]).to_not be_nil
        end
        
        it 'sets @contact_me' do
          expect(assigns[:contact_me]).to be_instance_of ContactMe
        end
        
        it 'renders :new' do
          expect(response).to render_template :new
        end
      end
    end

    context 'xhr request', js: true do
      it 'sets @contact_me' do
        xhr :post, :create, contact_me: {email: Faker::Internet.email, name: Faker::Name.name, body: Faker::Lorem.words(5).join("\s")}
        expect(assigns[:contact_me]).to be_instance_of ContactMe
      end
    end
  end

  describe 'GET show' do
    let(:user) {Fabricate :user}
  
    before do
      add_user_to_role(user, 'Administrator')
      session[:user_id] = user.id
    end
    after {clear_mailbox}

    it 'sets @contact_me' do
      contact_me = Fabricate :contact_me
      get :show, id: contact_me.id
      expect(assigns[:contact_me]).to be_instance_of ContactMe
    end
  end
end