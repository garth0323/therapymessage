class MessageMailer < ActionMailer::Base
  default from: "no-reply@therapymessages.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.messge_mailer.mesage_created_notification.subject
  #
  def message_created_notification(user, message)
    @user = user
    @message = message
    mail to: user.email, subject: "Success! You sent a message on therapyMessages"
  end
end
