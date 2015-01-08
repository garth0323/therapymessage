class Message < ActiveRecord::Base
  belongs_to :provider
  belongs_to :client
end
