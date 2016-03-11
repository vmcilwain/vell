class ProjectPolicy < ApplicationPolicy
  def new?
    user.admin?
  end
end
