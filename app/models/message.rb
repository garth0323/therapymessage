class Message < ActiveRecord::Base
  belongs_to :provider
  belongs_to :client

  paginates_per 5
  
  def self.inbox(id, query)
    message = Message.where({receiver_id: id, archived: false})
    if query.present?
      message = message.text_search(query)
    end
    return message
  end

  def self.text_search(query)
    where("subject @@ :q or body @@ :q", q: query)
  end
end
