class User < ActiveRecord::Base

  has_many :views
  has_many :invitations

  has_attached_file :avatar, styles: { medium: '300x300>', thumb: '100x100>' }
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/                            
  
  validates :first_name, presence: :true
  validates :last_name, presence: :true
  validates :email, presence: :true, uniqueness: :true
  validates :phone, presence: :true, uniqueness: :true
  validates :type, presence: :true

  TYPES = %w(Client Provider)

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.find_receiver(id)
    rec = where(id: id).first
    "#{rec.first_name} #{rec.last_name}, #{rec.email}"
  end

  def self.compose_user(id)
    mail = id.split
    where(email: mail[2]).first.id
  end
end
