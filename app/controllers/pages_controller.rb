class PagesController < ApplicationController
  autocomplete :provider, :first_name, :extra_data => [:last_name, :email]

  def index
  end

end