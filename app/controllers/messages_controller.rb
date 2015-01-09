class MessagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @message = Message.new
    @messages = Message.where(receiver_id: current_user.id).order("created_at DESC")
  end

  def show
    @message = Message.where(id: params[:id]).first
  end

  def sent
    @sent = Message.where(sender_id: current_user.id).order("created_at DESC")
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

  private

  def message_params
    params.require(:message).permit!
  end

end