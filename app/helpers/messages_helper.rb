module MessagesHelper
  def first_and_last(id)
    user = User.where(id: id).first
    "#{user.first_name} #{user.last_name}"
  end

  def last_viewed(message_id)
    if View.where(message_id: message_id, user_id: current_user.id).exists?
      opened = View.where(message_id: message_id, user_id: current_user.id).last.updated_at
      return "Opened #{distance_of_time_in_words(opened, Time.now)} ago"
    else
      return "Unopened"
    end
  end

end