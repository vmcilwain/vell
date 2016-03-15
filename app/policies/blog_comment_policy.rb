class BlogCommentPolicy < ApplicationPolicy
  def index?
    user.admin?
  end

  alias_method :edit?, :index?
  alias_method :update?, :index?
  alias_method :destroy?, :index?
end
