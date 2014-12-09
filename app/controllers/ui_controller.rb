class UiController < ApplicationController
   before_action do
    redirect_to root_path
  end
end
