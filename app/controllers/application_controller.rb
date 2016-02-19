# @author Lovell McIlwain
# Root controller which all other controllers inherit from
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  protect_from_forgery with: :exception
  
  # Redirects visitors to root path if user is not an administrator
  def require_admin
    unless current_user.admin?
      redirect_to root_path
      flash[:error] = 'You are not authorized!'
    end
  end
end
