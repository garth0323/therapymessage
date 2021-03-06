class Message < ActiveRecord::Base

  belongs_to :provider
  belongs_to :client
  has_many :views

  paginates_per 5
  
  def self.inbox(id)
    where({receiver_id: id, archived: false}).order("created_at DESC")
  end

  def self.show_message(id, user)
    View.create(message_id: id, user_id: user)
    where(id: id).first
  end

  def self.sent_box(id)
    where(sender_id: id, archived: false).order("created_at DESC")
  end

  def compose
    if params[:receiver_id].present?
      @receiver = User.where(id: params[:receiver_id]).pluck(:email).first
    end
    Message.new
  end

  def self.sent_message_email(user, message)
    rec = User.find(message.receiver_id)
    if user.type == "Client"
      MessageMailer.message_created_notification(user, message).deliver!
      MessageMailer.message_received_notification(rec, message).deliver!
    else
      MessageMailer.message_responded_notification(rec, message).deliver!
    end
  end

  

  
  
end
