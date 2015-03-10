class HomeController < ApplicationController
  # before_action :home, only: [:edit, :update]
 #  before_action :require_user, except: [:index, :about]
 #  before_action :require_admin, except: [:index, :about]
 #  def index
 #    @home = Home.first
 #  end
 #
 #  def about
 #    @home = Home.first
 #  end
 #
 #  def new
 #    @home = Home.new
 #  end
 #
 #
 #  def create
 #    @home = Home.new(home_params)
 #    @home.save
 #    flash[:success] = 'Home info updated'
 #    redirect_to root_path
 #  end
 #  private
 #
 #  def home
 #    @home = Home.find(params[:id])
 #  end
 #
 #  def home_params
 #    params.require(:home).permit(:index, :about)
 #  end
end
