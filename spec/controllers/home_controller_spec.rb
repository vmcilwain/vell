require 'rails_helper'

describe HomeController do
  describe 'GET index' do
    it 'sets @contact_me' do
      get :index
      expect(assigns[:contact_me]).to be_instance_of ContactMe
    end
  end
end