class ContactMeController < ApplicationController
  def index
    @contact_mes = ContactMe.all
  end
  
  def create
    @contact_me = ContactMe.new(contact_me_params)
    flash[:success] = "Your message has been sent."
    redirect_to root_path
  end
  
  private
  
  def contact_me_params
    params.require(:contact_me).permit(:name, :email, :body)
  end
end