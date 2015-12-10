class MessageMailer < ApplicationMailer
  default from: "<noreply@carltruong.com>"
  default to: "Carl Truong <carl@tabrific.com>"
  
  def new_message(message)
    @message = message
    mail subject: "New Message From #{message.name}"
  end
end
