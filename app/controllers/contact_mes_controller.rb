# @author Lovell McIlwain
# Handles HTTP actions for contact mes
class ContactMesController < ApplicationController
  # Before action to prompt for authentication
  # @note uses devise gem
  before_action :authenticate_user!, except: [:new, :create]
  
  # Before action to check users privilege
  # (see ApplicationController#require_admin)
  before_action :require_admin, except: [:new, :create]
  
  # Handles HTTP GET
  #
  # @return [Array] the list of contact mes found
  def index
    authorize ContactMe
    @contact_mes = ContactMe.search(params.fetch(:q, "*"), page: params[:page], per_page: 10) #elasticsearch
  end
  
  # Handles HTTP GET
  #
  # @return [ContactMe] a new contact me object
  def new
    @contact_me = ContactMe.new
  end
  
  # Handles HTTP POST
  #
  # @param contact_me [Hash] the submitted attributes
  # (see #contact_me_params)
  # @return [ContactMe] the created contact me
  # @return [Hash] the flash notice
  # @note sends email notification upon submission
  def create
    @contact_me = ContactMe.new(contact_me_params)
    respond_to do |format|
      if @contact_me.save
        flash[:success] = "Your message has been sent."
        Notify.send_contact_me(@contact_me).deliver_now
        format.html {redirect_to root_path}
        format.js {}
      else
        flash[:error] = "There was a problem with your message."
        # Think of a better way to do this and also to persist the data so user doesn't have to rewrite their message.
        flash[:contact_me_errors] = @contact_me.errors.full_messages
        format.html {render :new}
        format.js {}
      end
    end
  end
  
  # Handles HTTP GET
  #
  # @param id [Integer] the id of the requested contact me
  # @return [ContactMe] the contact me object found
  def show
    @contact_me = ContactMe.find(params[:id])
    authorize @contact_me
  end
  
  private
  
  # The whitelist of attributes allowed to be submitted to contact me
  def contact_me_params
    params.require(:contact_me).permit(:name, :email, :body)
  end
end