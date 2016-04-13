class MessagesController < ApplicationController
  def new
    @message = Message.new
    respond_to do |format|
      format.js
    end
  end

  def create
    @message = Message.new(message_params)
    if @message.save!
      MessageMailer.new_message(@message).deliver_now
      flash.now[:notice] = "Your message has been sent!"
    else
      flash.now[:alert] = "An error occurred, please try again."
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
