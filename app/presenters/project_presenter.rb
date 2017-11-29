# @author Lovell McIlwain
#
# Presenter class for object views
class ProjectPresenter < BasePresenter
  # Reference initialized object_presenter as object
  presents :project

  delegate :description, to: :project, allow_nil: true
  delegate :live_url, to: :project, allow_nil: true
  delegate :repo_url, to: :project

  # Return an external path to source code
  def repo_link
    link_to project.repo_url, project.repo_url, target: :blank
  end

  # Return edit path
  def edit_link
    link_to :Edit, edit_project_path(project), class: 'btn btn-default'
  end

  # Return destroy path
  def delete_link
    link_to :Delete, project, method: :delete, data: {confirm: 'Are you sure?'}, class: 'btn btn-default'
  end

  # Return an external path to live code
  def live_link
    link_to project.live_url, project.live_url, target: :blank
  end
end
