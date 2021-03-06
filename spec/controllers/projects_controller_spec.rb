require 'rails_helper'

describe ProjectsController do
  let(:user) {Fabricate :user, admin: true}
  let(:project) {Fabricate :project}
  let(:projects) {[]}

  describe 'GET show' do
    before {get :show, params: {id: project.id}}

    it 'sets @project' do
      expect(assigns[:project]).to eq project
    end
  end

  describe 'GET new' do
    before do
      sign_in user
      get :new
    end

    it_behaves_like 'requires sign in' do
      let(:action) {get :new}
    end

    it 'sets @project' do
      expect(assigns[:project]).to be_a_new Project
    end
  end

  describe 'POST create' do
    before {sign_in user}
    context 'a successful project creation' do
      before {post :create, params: {project: Fabricate.attributes_for(:project)}}

      it_behaves_like 'requires sign in' do
        let(:action) {post :create, params: {project: Fabricate.attributes_for(:project)}}
      end

      it 'redirects_to :show' do
        expect(response).to redirect_to Project.last
      end

      it 'sets @project' do
        expect(assigns[:project]).to eq Project.last
      end

      it 'sets flash[:success]' do
        expect(flash[:success]).to_not be_nil
      end
    end

    context 'an unsuccessful project creation' do
      before {post :create, params: {project: Fabricate.attributes_for(:project, repo_url: nil)}}

      it_behaves_like 'requires sign in' do
        let(:action) {post :create, params: {project: Fabricate.attributes_for(:project, repo_url: nil)}}
      end

      it 'renders :new' do
        expect(response).to render_template :new
      end

      it 'sets @project' do
        expect(assigns[:project]).to be_a_new Project
      end

      it 'sets flash[:error]' do
        expect(flash[:error]).to_not be_nil
      end
    end
  end

  describe 'GET index' do
    before do
      3.times {projects << Fabricate(:project)}
      get :index
    end

    it 'sets @projects' do
      expect(assigns[:projects].size).to eq projects.size
    end
  end

  describe 'GET edit' do
    before do
      sign_in user
      get :edit, params: {id: project.id}
    end

    it_behaves_like 'requires sign in' do
      let(:action) {get :edit, params: {id: project.id}}
    end

    it 'sets @project' do
      expect(assigns[:project]).to eq project
    end
  end

  describe 'PUT update' do
    before {sign_in user}
    context 'a successful project update' do
      before {put :update, params: {id: project.id, project: Fabricate.attributes_for(:project)}}

      it_behaves_like 'requires sign in' do
        let(:action) {put :update, params: {id: project.id, project: Fabricate.attributes_for(:project)}}
      end

      it 'redirects_to :show' do
        expect(response).to redirect_to project
      end

      it 'sets @project' do
        expect(assigns[:project]).to eq project
      end

      it 'sets flash[:success]' do
        expect(flash[:success]).to_not be_nil
      end
    end

    context 'an unsuccessful project update' do
      before {put :update, params: {id: project.id, project: Fabricate.attributes_for(:project, description: nil)}}

      it_behaves_like 'requires sign in' do
        let(:action) {put :update, params: {id: project.id, project: Fabricate.attributes_for(:project, description: nil)}}
      end

      it 'renders :edit' do
        expect(response).to render_template :edit
      end

      it 'sets @project' do
        expect(assigns[:project]).to eq project
      end

      it 'sets flash[:error]' do
        expect(flash[:error]).to_not be_nil
      end
    end
  end

  describe 'DELETE destroy' do
    before do
      sign_in user
      delete :destroy, params: {id: project.id}
    end

    it_behaves_like 'requires sign in' do
      let(:action) {delete :destroy, params: {id: project.id}}
    end

    it 'redirects_to :index' do
      expect(response).to redirect_to projects_path
    end

    it 'sets @project' do
      expect(assigns[:project]).to eq project
    end

    it 'destroys @project' do
      expect(Project.where(id: project.id)).to eq []
    end

    it 'sets flash[:success]' do
      expect(flash[:success]).to_not be_nil
    end
  end
end
