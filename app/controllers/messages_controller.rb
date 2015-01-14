class MessagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @messages = Message.where({receiver_id: current_user.id, archived: false}).order("created_at DESC")
  end

  def show
    View.create(message_id: params[:id], user_id: current_user.id)
    @message = Message.where(id: params[:id]).first
  end

  def sent
    @sent = Message.where(sender_id: current_user.id, archived: false).order("created_at DESC").page params[:page]
  end

  def new
    if params[:receiver_id].present?
      @receiver = User.where(id: params[:receiver_id]).pluck(:email).first
    end
    @message = Message.new
  end

  def create
    if current_user.type == "Provider"
      receiver_id = User.where(email: params[:message][:receiver_id]).first.id
      @message = Message.create(body: params[:message][:body], subject: params[:message][:subject], sender_id: params[:message][:sender_id], receiver_id: receiver_id)
    else
      @message = Message.create(message_params)
    end
    if @message.save
      # MessageMailer.message_created_notification(current_user, @message).deliver!
      redirect_to messages_path, notice: 'Message was successfully sent!'
    else
      redirect_to messages_path, notice: 'There was an error sending your message!'
    end
  end

  def archive
    @archived_sent = Message.where(sender_id: current_user.id, archived: true).order("created_at DESC")
    @archive = Message.where(receiver_id: current_user.id, archived: true).order("created_at DESC")
  end

  def ajax_archive
    Message.where(id: params[:id]).update_all(archived: true)
  end


  private

  def message_params
    params.require(:message).permit!
  end

end