class InvitationsController < ApplicationController
  

  def create
    @invitation = Invitation.create(email: params[:invitation][:email], user_id: params[:invitation][:user_id])
    if @invitation.save
      Invitation.invitation_email(@invitation)
      redirect_to messages_path, notice: 'Invitation was successfully sent!'
    else
      redirect_to messages_path, notice: 'There was an error sending your invitation, sorry!'
    end
  end

  private

  def invitation_params
    params.require(:invitation).permit!
  end

end