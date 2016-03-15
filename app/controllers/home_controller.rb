# @author Lovell McIlwain
# Handles HTTP actions for home
class HomeController < ApplicationController
  # Handles HTTP get
  #
  # @return [Array] blogs; the last 4 blogs created
  # @return [Array] projects; the last 4 projects created
  def index
    @blogs = Blog.last(4)
    @projects = Project.last(4)
  end
end
