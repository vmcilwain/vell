class ProjectsController < ApplicationController
  layout 'layout2'
  before_action :authenticate_user!, except: [:show, :index]
  before_action :project, only: [:show, :edit, :update, :destroy]

  def new
    authorize Project
    @project = Project.new
  end

  def create
    authorize Project
    @project = Project.new(project_params)

    if @project.save
      flash[:success] = 'Project saved'
      redirect_to @project
    else
      flash[:error] = error_message
      render :new
    end
  end

  def index
    authorize Project
    @projects = Project.search(params.fetch(:q, "*"), page: params[:page], per_page: 10, order: {id: :desc})
  end

  def update
    authorize @project
    if @project.update(project_params)
      flash[:success] = 'Project updated'
      redirect_to @project
    else
      flash[:error] = error_message
      render :edit
    end
  end

  def destroy
    authorize @project
    @project.destroy
    flash[:success] = 'Project destroyed'
    redirect_to projects_path
  end

  private

  def project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:repo_url, :live_url, :description)
  end
end
