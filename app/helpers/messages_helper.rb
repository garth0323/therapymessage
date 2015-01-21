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

  def display_message_created(message_id)
    message = Message.find message_id
    if message.created_at.present?
      "Created #{message.created_at.strftime('%A %d, %B')}"
    else
      " "
    end
  end

  def name_and_email(p)
    "#{p.first_name} #{p.last_name}, #{p.email}"
  end

end