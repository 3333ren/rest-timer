class AlarmsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :start, :destroy]
  before_action :task_all, only: [:new, :create, :start]

  def index
  end

  def new
    @alarm = Alarm.new
  end

  def create
    @alarm = Alarm.new(task_params)
    if @alarm.valid?
      @alarm.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    alarm = Alarm.find(params[:id])
    alarm.delete
    redirect_to new_alarm_path
  end

  def start
    @memo = Memo.new
  end

  def end
    @message = Message.where('id >= ?', rand(Message.first.id..Message.last.id)).first
  end

  private

  def task_params
    params.require(:alarm).permit(:task).merge(user_id: current_user.id)
  end

  def task_all
    @alarms = Alarm.includes(:user)
  end
end
