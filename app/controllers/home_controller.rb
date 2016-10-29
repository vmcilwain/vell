# @author Lovell McIlwain
# Handles HTTP actions for home
class HomeController < ApplicationController
  # Handles HTTP get
  #
  # @return [Array] blogs; the last 4 blogs created
  def index
    @blogs = Blog.last(4).reverse
  end
end
