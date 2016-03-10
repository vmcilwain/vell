class ProjectsController < ApplicationController
  before_action :project, only: [:show]
  private

  def project
    @project = Project.find(params[:id])
  end

  def model_params

  end
end
