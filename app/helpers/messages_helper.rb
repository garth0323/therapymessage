module MessagesHelper
  def first_and_last(id)
    user = User.where(id: id).first
    "#{user.first_name} #{user.last_name}"
  end
end