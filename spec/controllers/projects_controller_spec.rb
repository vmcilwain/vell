require 'rails_helper'

describe ProjectsController do
  let(:user) {Fabricate :user, admin: true}
  let(:project) {Fabricate :project}

  describe 'GET show' do
    before do
      sign_in user
      get :show, id: project.id
    end

    it 'sets @project' do
      expect(assigns[:project]).to eq project
    end
  end

  describe 'GET new'
  describe 'POST create'
  describe 'GET index'
  describe 'GET edit'
  describe 'PUT / PATCH update'
  describe 'DELETE destroy'
end
