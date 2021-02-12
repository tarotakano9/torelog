class TrainingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_day, only: [:edit, :destroy, :show, :update, :edit_log, :update_log]

  def index
    @search_params = day_search_params
    @days = Day.search(@search_params).includes(:user).where(user_id: current_user.id).order(date: 'DESC')
    # @days = Day.includes(:user).where(user_id: current_user.id).order(date: 'DESC')
  end

  def show
    @logs = Log.includes(:day).where(day_id: @day.id)
  end

  def edit
  end

  def edit_log
  end

  def update_log
    if @day.update(update_day_params)
      redirect_to trainings_path
    else
      render :edit
    end
  end

  def update
    if @day.update(update_day_params)
      redirect_to trainings_path
    else
      render :edit
    end
  end

  def destroy
    if @day.destroy
        redirect_to trainings_path
    else
        render :index
    end
  end

  def new
    @day = Day.new
    @day.logs.build
  end

  def create
    @day = Day.new(day_params)
    if @day.save
      redirect_to training_path(@day.id)
    else
      render :new
    end
  end

  def show_result
  end

  private

  def set_day
    @day = Day.find(params[:id])
  end

  def day_search_params
    params.fetch(:search, {})
      .permit(:date_from, :date_to, :chest, :shoulder, :tricep, :bicep, :back, :abdominal, :leg)
  end

  def day_params
    params.require(:day)
      .permit(
        :date, :chest, :shoulder, :tricep, :bicep, :back, :abdominal, :leg,
        [logs_attributes: [:training, :weight, :rep, :day_id]])
      .merge(user_id: current_user.id)
  end

  def update_day_params
    params.require(:day)
      .permit(
        :date, :chest, :shoulder, :tricep, :bicep, :back, :abdominal, :leg,
        [logs_attributes: [:training, :weight, :rep, :day_id, :_destroy, :id]])
      .merge(user_id: current_user.id)
  end
end
