class User < ActiveRecord::Base

  has_many :views
  
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
