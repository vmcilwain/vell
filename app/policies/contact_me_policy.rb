class ContactMePolicy < ApplicationPolicy
  def index?
    user.admin?
  end

  alias_method :show?, :index?
end
