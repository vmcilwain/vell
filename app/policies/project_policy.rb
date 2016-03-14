class ProjectPolicy < ApplicationPolicy
  def new?
    user.admin?
  end

  alias_method :create?, :new?
  alias_method :edit?, :new?
  alias_method :update?, :new?
  alias_method :delete?, :new?
end
