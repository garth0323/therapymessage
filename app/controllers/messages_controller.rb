class MessagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @message = Message.new
    @messages = Message.where(receiver_id: current_user.id).order("created_at DESC")
  end

  def create
    binding.pry
    @message = Message.create(message_params)
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