class MemosController < ApplicationController
  before_action :authenticate_user!, only: :create

  def index
    @memos = Memo.includes(:user).order('created_at DESC')
  end

  def create
    Memo.create(memo_params)
  end

  private

  def memo_params
    params.require(:memo).permit(:good, :black).merge(user_id: current_user.id)
  end
end
