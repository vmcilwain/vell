class ProjectsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :project, only: [:show]

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      flash[:success] = 'Project saved'
      redirect_to @project
    else
      flash[:error] = error_message
      render :new
    end
  end

  private

  def project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:repo_url, :live_url, :description)
  end
end
