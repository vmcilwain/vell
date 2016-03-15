# @author Lovell McIlwain
# Root controller which all other controllers inherit from
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  protect_from_forgery with: :exception

  private

  def error_message
    "There were errors!"
  end
end
