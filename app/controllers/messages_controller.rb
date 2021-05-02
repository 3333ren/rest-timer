class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    Message.create(message_params)
    redirect_to root_path
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
