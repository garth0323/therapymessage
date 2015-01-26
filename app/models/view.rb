class View < ActiveRecord::Base
  belongs_to :message
  belongs_to :provider
  belongs_to :client
end
