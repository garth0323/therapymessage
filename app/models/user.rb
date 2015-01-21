class User < ActiveRecord::Base
  
  TYPES = %w(Client Provider)

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.find_receiver(id)
    rec = where(id: id).first
    "#{rec.first_name} #{rec.last_name}, #{rec.email}"
  end

  def self.compose_user(id)
    where(email: id).first.id
  end
end
