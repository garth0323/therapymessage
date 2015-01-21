class Provider < User
  has_many :messages

  paginates_per 20

  def self.text_search(query)
    if query.present?
      where("first_name @@ :q or last_name @@ :q", q: query)
    else
      all
    end
  end

  def self.all_providers
    all
  end

end