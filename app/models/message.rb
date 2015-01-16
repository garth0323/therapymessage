class Message < ActiveRecord::Base
  include PgSearch
  multisearchable :against => [:subject, :body]

  belongs_to :provider
  belongs_to :client

  paginates_per 5
  
  def self.inbox(id, query)
    binding.pry
    if query.present?
      message = PgSearch.multisearch(query).where({receiver_id: id, archived: false})
    else
      message = Message.where({receiver_id: id, archived: false})
    end
    return message
  end

  # def self.text_search(query)
  #   binding.pry
  #   where("subject @@ :q or body @@ :q", q: query)
  #   User.where("first_name @@ :q or last_name @@ :q", q: query).id
  # end
end
