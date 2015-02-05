class InvitationMailer < ActionMailer::Base
  default from: "no-reply@therapymessages.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.messge_mailer.mesage_created_notification.subject
  #
  def invitation_to_therapist(invitation)
    @user = invitation.user
    mail to: invitation.email, subject: "Your client has invited you to join TherapyMessages"
  end

  def invitation_to_client(invitation)
    @user = invitation.user
    mail to: invitation.email, subject: "Your therapist has invited you to join TherapyMessages"
  end
end