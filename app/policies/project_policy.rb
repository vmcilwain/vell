class ProjectPolicy < ApplicationPolicy
  def new?
    user && user.admin?
  end

  def index?; true; end

  alias_method :create?, :new?
  alias_method :edit?, :new?
  alias_method :update?, :new?
  alias_method :destroy?, :new?
  alias_method :show?, :index?
end
