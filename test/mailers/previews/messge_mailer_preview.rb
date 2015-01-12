# Preview all emails at http://localhost:3000/rails/mailers/messge_mailer
class MessgeMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/messge_mailer/mesage_created_notification
  def mesage_created_notification
    MessgeMailer.mesage_created_notification
  end

end
