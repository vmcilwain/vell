# @author Lovell McIlwain
# Root controller which all other controllers inherit from
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  # Redirects visitors to root path if user is not an administrator
  def require_admin
    redirect_to root_path unless current_user.admin?
  end
end
