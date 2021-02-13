class HomeController < ApplicationController
  def index
  end

  def option
    
  end

  def destroy_user
    user = current_user
    if user.destroy
      redirect_to root_path
    else
      render :option
    end
  end

  def destroy_day
    days = Day.includes(:user).where(user_id: current_user.id)
    if days.destroy_all
      redirect_to root_path
    else
      render :option
    end
  end
end
