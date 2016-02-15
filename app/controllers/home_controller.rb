class HomeController < ApplicationController
  def index
    @blogs = Blog.last(4)
  end
end
