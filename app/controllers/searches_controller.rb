class SearchesController < ApplicationController
  def index
    case search_params[:klass]
    when 'article'
      search_and_render_articles
    when 'project'
      search_and_render_projects
    else
      render template: 'searches/error'
    end
  end

  private

  def search_and_render_articles
    @blogs = Blog.search(params.fetch(:q, "*"), page: params[:page], per_page: 10, order: {id: :desc})
    render template: 'searches/articles'
  end

  def search_and_render_projects
    @projects = Project.search(params.fetch(:q, "*"), page: params[:page], per_page: 10, order: {id: :desc})
    render template: 'searches/projects'
  end

  def search_params
    params.permit(:klass, :q)
  end
end
