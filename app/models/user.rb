class User < ActiveRecord::Base
  include PgSearch
  multisearchable :against => [:first_name, :last_name]
  
  TYPES = %w(Client Provider)

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
end
