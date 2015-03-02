class HomeController < ApplicationController
  def index
    @contact_me = ContactMe.new
  end
end
