class ContactMePolicy < ApplicationPolicy
  def index?
    user && user.admin?
  end

  def new?; true; end

  alias_method :show?, :index?
  alias_method :create?, :new?
end
