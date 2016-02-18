class ContactMesController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create]
  before_action :require_admin, except: [:new, :create]
  def index
    authorize ContactMe
    @contact_mes = ContactMe.search(params.fetch(:q, "*"), page: params[:page], per_page: 10) #elasticsearch
  end
  
  def new
    @contact_me = ContactMe.new
  end
  
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
  
  def show
    @contact_me = ContactMe.find(params[:id])
    authorize @contact_me
  end
  
  private
  
  def contact_me_params
    params.require(:contact_me).permit(:name, :email, :body)
  end
end