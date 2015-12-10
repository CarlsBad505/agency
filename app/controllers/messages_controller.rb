class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.valid?
      MessageMailer.new_message(@message).deliver
      flash[:notice] = "Your message has been sent!"
    else
      flash[:alert] = "An error occurred, please try again."
      render new
    end
  end
  
  private
  
  def message_params
    params.require(:message).permit(:name, :email, :content, :phone)
  end
end
