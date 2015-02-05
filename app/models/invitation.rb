class Invitation < ActiveRecord::Base
  belongs_to :user

  validates :email, presence: true
  validates :user_id, presence: true

  def self.invitation_email(invitation)
    if invitation.user.type == "Client"
      InvitationMailer.invitation_to_therapist(invitation).deliver!
    else
      InvitationMailer.invitation_to_client(invitation).deliver!
    end
  end

end
