class MessagesController < ApplicationController
  before_action :require_login

  def index
    @messages = Message.inbox(current_user.id).page params[:page]
    @invitation = Invitation.new
    # @messages = messages.text_search(params[:query]).page params[:page]
  end

  def show
    @message = Message.show_message(params[:id], current_user.id)
  end

  def sent
    @sent = Message.sent_box(current_user.id).page params[:page]
  end

  def new
    @receiver = User.find_receiver(params[:receiver_id])
    @message = Message.new
  end

  def create
    receiver_id = User.compose_user(params[:message][:receiver_id])
    @message = Message.create(body: params[:message][:body], subject: params[:message][:subject], sender_id: params[:message][:sender_id], receiver_id: receiver_id)
    if @message.save
      Message.sent_message_email(current_user, @message)
      redirect_to messages_path, notice: 'Message was successfully sent!'
    else
      redirect_to messages_path, notice: 'There was an error sending your message!'
    end
  end

  def archive
    @archived_sent = Message.where(sender_id: current_user.id, archived: true).order("created_at DESC").page params[:page]
    @archive = Message.where(receiver_id: current_user.id, archived: true).order("created_at DESC").page params[:page]
  end

  def ajax_archive
    Message.where(id: params[:id]).update_all(archived: true)
  end

  def providers
    @therapists = Provider.text_search(params[:query]).page params[:page]
  end

  def invitation
    @invitation = Invitation.new
    # redirect_to messages_path, notice: 'Invitation was successfully sent!'
  end


  private

  def message_params
    params.require(:message).permit!
  end

  def require_login
    unless current_user
      redirect_to root_path
    end
  end

end