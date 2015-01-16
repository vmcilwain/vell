class ContactMesController < ApplicationController
  def index
    @contact_mes = ContactMe.all
  end
  
  def create
    @contact_me = ContactMe.new(contact_me_params)
    respond_to do |format|
      if @contact_me.save
        flash[:success] = "Your message has been sent."
        format.html {redirect_to root_path}
      else
        flash[:error] = "There was a problem with your message."
        format.html {redirect_to root_path}
      end
    end
  end
  
  def show
    @contact_me = ContactMe.find(params[:id])
  end
  
  private
  
  def contact_me_params
    params.require(:contact_me).permit(:name, :email, :body)
  end
end