class MessagesController < ApplicationController
  def new
    @message = Message.new
    respond_to do |format|
      format.js
    end
  end

  def create
    @message = Message.new(message_params)
    if @message.valid?
      MessageMailer.new_message(@message).deliver_now
    end
    respond_to do |format|
      format.js
    end
  end
  
  private
  
  def message_params
    params.require(:message).permit(:name, :email, :content, :phone)
  end
end
