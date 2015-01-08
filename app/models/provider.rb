class Provider < User
  has_many :messages

  def name_and_email
    "#{first_name} #{last_name}, #{email}"
  end

end