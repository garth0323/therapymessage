class MessagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @messages = Message.where({receiver_id: current_user.id, archived: false}).order("created_at DESC")
  end

  def show
    @message = Message.where(id: params[:id]).first
  end

  def sent
    @sent = Message.where(sender_id: current_user.id, archived: false).order("created_at DESC")
  end

  def new
    @message = Message.new
  end

  def create
    if current_user == "Provider"
      receiver_id = User.where(email: params[:receiver_id]).first.receiver_id
      @message = Message.create(message_params).merge(receiver_id: receiver_id)
    else
      @message = Message.create(message_params)
    end
    if @message.save
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