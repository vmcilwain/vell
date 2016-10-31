
require 'rails_helper'
#
describe ProjectPresenter do
  include_behavior

  let(:presenter) {ProjectPresenter.new(project, view)}
  let(:project) {Fabricate :project}

  it 'returns the link to the source code' do
    expect(presenter.repo_link).to eq link_to project.repo_url, project.repo_url, target: :blank
  end

  it 'returns edit path' do
    expect(presenter.edit_link).to eq link_to :Edit, edit_project_path(project)
  end

  it "returns destroy path" do
    expect(presenter.delete_link).to eq link_to :Delete, project, method: :delete, data: {confirm: 'Are you sure?'}
  end

  it "returns the link to live code" do
    expect(presenter.live_link).to eq link_to project.live_url, project.live_url, target: :blank
  end
end
