class Message < ActiveRecord::Base
  belongs_to :provider
  belongs_to :client

  paginates_per 5
  
end
