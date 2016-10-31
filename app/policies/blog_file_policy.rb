class BlogFilePolicy < ApplicationPolicy
  def index?
    user && user.admin?
  end

  def download?; true; end

  alias_method :new?, :index?
  alias_method :create?, :index?
  alias_method :edit?, :index?
  alias_method :update?, :index?
  alias_method :destroy?, :index?
end
