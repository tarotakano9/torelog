class TrainingsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
    @day = Day.new
  end

  def create
    @day = Day.new(day_params)
    judge_target_exists
    if @day.save
      redirect_to  submit_log_training_path(@day.id)
    else
      render :new
    end
  end

  def submit_log
    @day = Day.find(params[:id])
    @log = Log.new
  end

  private

  def day_params
    params.require(:day).permit(
      :date, :target_exists, :chest, :shoulder, :tricep, :bicep, :back, :abdominal, :leg
    ).merge(user_id: current_user.id)
  end

  def judge_target_exists
    if @day.chest || @day.shoulder || @day.tricep || @day.bicep || @day.back || @day.abdominal || @day.leg
      @day.target_exists = true
    else
      @day.target_exists = nil
    end
  end
end
