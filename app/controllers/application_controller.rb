# @author Lovell McIlwain
# Root controller which all other controllers inherit from
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  protect_from_forgery with: :exception

  # Rescue from pundit error
  # (see #user_not_authorized)
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  private

  def error_message
    "There were errors!"
  end

  # Method to gracefully let a user know they are are not authorized
  #
  # @return flash [Hash] the action notice
  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to root_path
  end
end
