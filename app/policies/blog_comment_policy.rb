class BlogCommentPolicy < ApplicationPolicy
  def index?
    user && user.admin?
  end

  def new?; true; end

  alias_method :edit?, :index?
  alias_method :update?, :index?
  alias_method :destroy?, :index?
  alias_method :create?, :new?
end
