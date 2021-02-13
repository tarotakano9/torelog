class HomeController < ApplicationController
  def index
  end

  def option
    
  end

  def destroy_user
    user = current_user
    binding.pry
    if user.destroy
      redirect_to root_path
    else
      render :option
    end
  end
end
